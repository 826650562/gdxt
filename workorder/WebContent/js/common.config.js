/*
 *通用的配置位置 
 * wxl
 */

var GDXT = {
	isPoneAvailable : function($poneInput) {
		var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
		if (!myreg.test($poneInput.val())) {
			return false;
		} else {
			return true;

		}
	}
}