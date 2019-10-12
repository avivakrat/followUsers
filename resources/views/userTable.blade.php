@include('login',['user' => $currentUser,'action' => 'login'])
<hr>
<div id="users-list" class="row justify-content-center">
    <div class="col-6">
        <p class="font-weight-bold">Choose users to follow:</p>
        @foreach($users as $user)
        <div class="clearfix margin-bottom">
            {{$user->user_name}}, {{$user->group_name}} (<span class="counter" userID="{{$user->id}}">{{$user->followers_count}}</span>)
            @if($user->follows)
            <button class="btn btn-following float-right" userID="{{$user->id}}"><span>Following</span></button>
            @else
            <button class="btn btn-follow float-right" userID="{{$user->id}}">Follow</button>
            @endif
        </div>
        @endforeach
    </div>
</div>