<div class="row">
    <div id="login-bar" class="col-md-12">
        @if($action == 'login' && isset($user->name))
        <span id="welcome-msg">Hello {{$user->name}}</span>
        <button class="btn btn-primary float-right btn-logout">Logout</button>
        @else
        <span id="welcome-msg">Must be signed in</span>
        <button class="btn btn-primary float-right btn-login">Login</button>
        @endif
    </div>
</div>