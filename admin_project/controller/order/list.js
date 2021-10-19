angular.module('App').controller('OrderController', function ($rootScope, $scope, $http, $mdToast, $mdDialog, $cookies, request) {
	if (!$scope.isCookieExist()) { window.location.href = '#login'; }

    var self = $scope;
	var root = $rootScope;

	root.search_enable = true;
    root.toolbar_menu = { title: 'Thêm đơn hàng' };
	root.pagetitle = 'Đơn hàng';

	// receiver barAction from rootScope
    self.$on('barAction', function (event, data) {
        root.setCurOrderId("");
        window.location.href = '#create_order';
    });

    // receiver submitSearch from rootScope
    self.$on('submitSearch', function (event, data) {
        self.q = data;
        self.loadPages();
    });

	self.loadPages = function () {
		$_q = self.q ? self.q : '';
        request.getAllProductOrderCount($_q).then(function (resp) {
            self.paging.total = Math.ceil(resp.data / self.paging.limit);
            self.paging.modulo_item = resp.data % self.paging.limit;
        });
		$limit = self.paging.limit;
		$current = (self.paging.current * self.paging.limit) - self.paging.limit + 1;
		if (self.paging.current == self.paging.total && self.paging.modulo_item > 0) {
			self.limit = self.paging.modulo_item;
		}
		request.getAllProductOrderByPage($current, $limit, $_q).then(function (resp) {
			self.product_order = resp.data;
			self.loading = false;
			//console.log(JSON.stringify(resp.data));
		});
	}

	//pagination property
	self.paging = {
		total: 0, // total whole item
		current: 1, // start page
		step: 3, // count number display
		limit: 20, // max item per page
		modulo_item: 0,
		onPageChanged: self.loadPages,
	};

    self.editOrder = function(ev, po) {
        root.setCurOrderId(po.id);
        window.location.href = '#create_order';
    };

	self.detailsOrder = function(ev, po) {
		$mdDialog.show({
			controller          : DetailsOrderControllerDialog,
			templateUrl         : 'view/order/details.html',
			parent              : angular.element(document.body),
			targetEvent         : ev,
			clickOutsideToClose : true,
			order               : po,
            process             : false
		})
	};

    self.processedOrderConfirm = function(ev, po) {
        var confirm = $mdDialog.confirm().title('Xác nhận xử lí đơn hàng');
            confirm.content('Sau khi được xử lí, trạng thái đơn hàng sẽ không thể thay đổi và số lượng sản phẩm sẽ giảm.' +
                            '<br>Hãy kiểm tra lại đơn hàng trước khi đồng ý');
            confirm.targetEvent(ev).ok('ĐỒNG Ý').cancel('HUỶ');

        $mdDialog.show(confirm).then(function() {
            $mdDialog.show({
                controller          : DetailsOrderControllerDialog,
                templateUrl         : 'view/order/details.html',
                parent              : angular.element(document.body),
                targetEvent         : ev,
                clickOutsideToClose : true,
                order               : po,
                process             : true
            })
        });
    };

    self.cancelOrder = function(ev, po) {
        var confirm = $mdDialog.confirm().title('Xác nhận huỷ đơn hàng');
            confirm.content('Bạn có chắc muốn <b>HUỶ</b> đơn hàng từ : '+po.buyer+' ?');
            confirm.targetEvent(ev).ok('ĐỒNG Ý').cancel('HUỶ');

        $mdDialog.show(confirm).then(function() {
            var new_ob = angular.copy(po);
            new_ob.status = 'CANCEL';
            request.updateOneProductOrder(new_ob.id, new_ob).then(function(resp){
                if(resp.status == 'success'){
				    root.showConfirmDialogSimple('', 'Huỷ đơn hàng từ '+po.buyer+' <b>thành công</b>!', function(){
				        window.location.reload();
				    });
                }else{
                    root.showInfoDialogSimple('', 'Lỗi , <b>Huỷ thất bại</b> Đơn hàng từ '+po.buyer);
                }
            });
        });
    };

    self.deleteOrder = function(ev, po) {
        var confirm = $mdDialog.confirm().title('Xác nhận xoá đơn hàng');
            confirm.content('Bạn có chắc muốn <b>XOÁ</b> đơn hàng từ : '+po.buyer+' ?');
            confirm.targetEvent(ev).ok('ĐỒNG Ý').cancel('HUỶ');

        $mdDialog.show(confirm).then(function() {
            request.deleteOneProductOrder(po.id).then(function(resp){
                if(resp.status == 'success'){
                    root.showConfirmDialogSimple('', 'Xoá đơn hàng từ '+po.buyer+' <b>thành công</b>!', function(){
                        window.location.reload();
                    });
                }else{
                    root.showInfoDialogSimple('', 'Lỗi , <b>Xoá thất bại</b> Đơn hàng từ '+po.buyer);
                }
            });
        });

    };
});

function DetailsOrderControllerDialog($scope, $rootScope, $mdDialog, request, $mdToast, $route, order, process) {
	var self        	= $scope;
	var root            = $rootScope;
	self.order      	= angular.copy(order);
	self.process      	= process;
	self.order_details 	=  null;
	self.hide   = function() { $mdDialog.hide(); };
	self.cancel = function() { $mdDialog.cancel(); };
	self.order.total_fees = parseFloat(self.order.total_fees).toFixed(2)

	request.getAllProductOrderDetailByOrderId(order.id).then(function (resp) {
		self.order_details = resp.data;
        // calculate data
        self.calculateTotal();
	});

    request.getAllConfig().then(function (resp) {
        self.config = resp.data;
        self.conf_currency = root.findValue(self.config, 'CURRENCY');
        self.conf_tax = root.findValue(self.config, 'TAX');
        self.conf_featured_news = root.findValue(self.config, 'FEATURED_NEWS');
    });

	self.getPriceTotal = function (pod) {
	    return parseFloat(pod.price_item*pod.amount).toFixed(2);
    };

	self.calculateTotal = function () {
	    var price_total = 0;
	    var price_tax = 0;
	    self.amount_total = 0;
	    self.price_tax_formatted = 0;
	    self.price_total_formatted = 0;
	    self.price_after_tax = 0;
        for(var i=0; i<self.order_details.length; i++){
            self.amount_total += self.order_details[i].amount;
            price_total += self.order_details[i].price_item * self.order_details[i].amount;
        }
	    price_tax = (self.order.tax / 100) * price_total;
        self.price_tax_formatted = parseFloat(price_tax).toFixed(2);
        self.price_total_formatted = parseFloat(price_total).toFixed(2);
        self.price_after_tax = parseFloat(price_total + price_tax).toFixed(2);
    };

    self.processOrder = function (od) {
        request.processProductOrder(od.id, od, self.order_details).then(function(resp){
            //console.log(JSON.stringify(resp));
            $mdDialog.show({
                templateUrl         : 'view/order/process_result.html',
                parent              : angular.element(document.body),
                clickOutsideToClose : false,
                resp                : resp,
                order               : od,
                controller          : function DialogController($scope, $rootScope, $mdDialog, $route, resp, order) {
                    $scope.resp     = resp;
                    $scope.order    = order;
                    $scope.success  = ( resp.status == 'success' );
                    $scope.cancel   = function() {
                        $mdDialog.cancel();
                        if($scope.success){
                            window.location.reload();
                        }
                    };
                    $scope.edit   = function() {
                        $mdDialog.cancel();
                        root.setCurOrderId(od.id);
                        window.location.href = '#create_order';
                    };
                }
            });
        });
    };
}