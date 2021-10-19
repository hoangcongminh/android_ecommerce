angular.module('App').controller('CategoryController', function ($rootScope, $scope, $http, $mdToast, $mdDialog, $cookies, request) {
	var self = $scope;
	var root = $rootScope;

	if (!root.isCookieExist()) { window.location.href = '#login'; }

	root.search_enable = true;
	root.toolbar_menu = { title: 'Thêm danh mục' };
	root.pagetitle = 'Danh mục';
	
	// receiver barAction from rootScope
	self.$on('barAction', function (event, data) {
		root.setCurCategoryId("");
		window.location.href = '#create_category';
	});
	
	// receiver submitSearch from rootScope
	self.$on('submitSearch', function (event, data) {
		self.q = data;
		self.loadPages();
	});
	
	self.loadPages = function () {
		$_q = self.q ? self.q : '';
		request.getAllCategoryCount($_q).then(function (resp) {
			self.paging.total = Math.ceil(resp.data / self.paging.limit);
			self.paging.modulo_item = resp.data % self.paging.limit;
		});
		$limit = self.paging.limit;
		$current = (self.paging.current * self.paging.limit) - self.paging.limit + 1;
		if (self.paging.current == self.paging.total && self.paging.modulo_item > 0) {
			self.limit = self.paging.modulo_item;
		}
		request.getAllCategoryByPage($current, $limit, $_q).then(function (resp) {
			self.category = resp.data;
			self.loading = false;
			//console.log(JSON.stringify(resp.data));
		});
	};

	//pagination property
	self.paging = {
		total: 0, // total whole item
		current: 1, // start page
		step: 3, // count number display
		limit: 20, // max item per page
		modulo_item: 0,
		onPageChanged: self.loadPages,
	};
	
	self.editCategory = function(ev, c) {
		root.setCurCategoryId(c.id);
		window.location.href = '#create_category';
	};

	self.deleteCategory = function(ev, c) {
		var confirm = $mdDialog.confirm().title('Xác nhận xoá');
			confirm.content('Bạn có chắc chắn muốn xoá danh mục : '+c.name+' ?');
			confirm.targetEvent(ev).ok('ĐỒNG Ý').cancel('HUỶ');
			
		var dir = "../../../uploads/category/";
		var images_obj = new Array();	
		images_obj.push(c.icon);
		$mdDialog.show(confirm).then(function() {
			request.deleteOneCategory(c.id).then(function(res){
				if(res.status == 'success'){
					request.deleteFiles(dir, images_obj).then(function(res){ });
				    root.showConfirmDialogSimple('', 'Xoá danh mục '+c.name+' <b>Thành công</b>!', function(){
				        window.location.reload();
				    });
				}else{
				    root.showInfoDialogSimple('', 'Lỗi , <b>Xoá thất bại</b> Danh mục '+c.name+'<br>danh mục này có thể đang được sử dụng');
				}
			});
		});

	};
	
	/* dialog View Icon*/
	self.viewIcon = function (ev, f) {
		$mdDialog.show({
			controller : ViewImageDialogController,
			parent: angular.element(document.body), targetEvent: ev, clickOutsideToClose: true, file_url: f,
			template: '<md-dialog ng-cloak aria-label="viewImage">' +
			'  <md-dialog-content style="max-width:800px;max-height:810px;" >' +
			'   <img style="margin: auto; max-width: 100%; max-height= 100%;" ng-src="{{file_url}}">' +
			'  </md-dialog-content>' +
			'</md-dialog>'
			
		})
	};

    /* dialog Publish confirmation*/
    self.publishDialog = function (ev, o) {
        $mdDialog.show({
            controller : PublishCategoryDialogCtl,
            parent: angular.element(document.body), targetEvent: ev, clickOutsideToClose: true, obj: o,
            template:
            '<md-dialog ng-cloak aria-label="publishData">' +
            '  <md-dialog-content>' +
            '   <h2 class="md-title">Xác nhận phát hành</h2> ' +
            '   <p>Bạn có chắc muốn phát hành danh mục : <b>{{obj.name}}</b> ?</p><br>' +
            '   <div layout="row"> <span flex></span>' +
            '       <md-button ng-if="!submit_loading" class="md-warn" ng-click="cancel()" >HUỶ</md-button>' +
            '       <md-button ng-click="publish()" class="md-raised md-primary">ĐỒNG Ý</md-button>' +
            '   </div>' +
            '  </md-dialog-content>' +
            '</md-dialog>'
        });
        function PublishCategoryDialogCtl($scope, $mdDialog, $mdToast, obj) {
            $scope.obj = angular.copy(obj);
            $scope.cancel = function() { $mdDialog.cancel(); };
            $scope.publish = function() {
                $scope.obj.draft = 0;
                request.updateOneCategory($scope.obj.id, $scope.obj).then(function(resp){
                    self.resp_submit = resp;
                    if(resp.status == 'success'){
                        root.showConfirmDialogSimple('', 'Phát hành danh mục '+obj.name+' <b>thành công</b>!', function(){
                            window.location.reload();
                        });
                    }else{
                        var failed_txt = 'Opps , <b>Phát hành thất bại</b> danh mục '+obj.name;
                        if(resp.msg != null) failed_txt = resp.msg;
                        root.showInfoDialogSimple('', failed_txt);
                    }
                });
            };
        }
    };

});
