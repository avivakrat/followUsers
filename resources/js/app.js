require('./bootstrap');
var User = require('./services/user.service.js');

//To change the UserID you want to login
window.defaultUserID = 1;

var user = new User();
var user_id = Cookies.get('user_id');

if(user_id) {
    user.setUser(user_id);
    user.render('render-in',renderContainer);
}
else {
    user.render('render-out',renderContainer);
}
    
    
//Register events
$(document).on('click','.btn-login', {user: user,defaultUserID: defaultUserID}, function(){
    user.login(defaultUserID);
    user.render('render-in',renderContainer);
});
$(document).on('click','.btn-logout', {user: user}, function(){
    user.logout();
    user.render('render-out',renderContainer);
});

$(document).on('click','.btn-follow, .btn-following', {user: user} , function(event){
    var button = $( event.target );
    var action = button.hasClass('btn-follow') ? 'follow' : 'unfollow';
    var user_id2 = button.attr('userID');
    
    disableFollowButton(button, true);
    
    user.follow(user_id2,action,function(){
            renderSuccessUserFollow(button,user_id2,action);
        },function(){
            disableFollowButton(button, false);
    });
});

function updateCounter(user_id,action) {
    var counterElement = $('.counter[userID="'+user_id+'"]');
    var value = (action === 'follow') ? 1 : -1;
    var counter = parseInt(counterElement.text(), 10) + value;
    counterElement.text(counter);
}

function renderContainer(data) {
    $('#main-container').empty();
    $('#main-container').append(data);
}

function renderFollowButton(button,action) {
    if(action == 'follow') {
        button.removeClass('btn-follow');
        button.addClass('btn-following');
        button.text('');
        button.append('<span>Following</span>'); //user span for css hover to change text
    }
    else {
        button.removeClass('btn-following');
        button.addClass('btn-follow');
        button.text('Follow');
    }
}

function renderSuccessUserFollow(button,user_id2,action) {
    renderFollowButton(button,action);
    updateCounter(user_id2,action);   
    disableFollowButton(button, false);      
}

function disableFollowButton (button,is_disabled) {
    button.attr("disabled", is_disabled); 
}