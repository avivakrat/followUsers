//UserService constructor function
function User() {
    
    this.user_id = null;
    this.baseUrl = "/users";
    this._token = $('meta[name="csrf-token"]').prop('content');

    /*
    * Set logged in user id
    *
    */

    this.setUser = function(user_id) {
        this.user_id = user_id;
    }

    /*
    * Login  
    *
    * @string userID: user id to login
    */
    this.login = function(userID) {
        var user_id = userID;
        Cookies.set('user_id', user_id, { expires: 7 });
        this.setUser(user_id);
    }

    /*
    * Logout 
    *
    */
    this.logout = function() {
        Cookies.remove('user_id');
        this.setUser(null);
    }

    /*
    * Follow / Unfollow user 2
    *
    * @string user_id2: user id to follow/unfollow
    * @string action: follow / un-follow
    * @function successCallBack: to render view when updated successfully
    * @function failCallBack: to render view when update failed
    */

    this.follow = function(user_id2,action,successCallBack,failCallBack) {
        var data = 'user_id1=' + this.user_id + '&user_id2=' + user_id2 + '&_token='+this._token;

        $.ajax({
            type: 'POST',
            url: this.baseUrl + '/' + action,
            data: data,
        })
        .done(function () { 
            if(successCallBack !== 'undefined')
                successCallBack();
        })
        .fail(function () {
            alert("Error updating entry"); 
            if(failCallBack !== 'undefined')
                failCallBack();
        })
    }

    /*
    * show content based on guest or signed in user
    *
    * @string action:  'render-in' / 'render-out' to 
    * @function callBack: to render view based on ajax return
    * 
    */
    this.render = function(action,callBack) {
        var data = '_token='+this._token;

        if(this.user_id) 
            data += '&user_id=' + this.user_id;

        $.ajax({ 
            type: 'POST',
            url: this.baseUrl + '/' + action,
            data: data,
        })
        .done(function (data) { 
            if(callBack !== 'undefined')
                callBack(data);
        })
        .fail(function (jqXHR) {
            alert(jqXHR.responseJSON.message); 
        });
    }
}

module.exports = User;
