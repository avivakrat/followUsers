<?php

namespace App\Http\Controllers;
use App\Services\UserService;
use Illuminate\Http\Request;

class UserController extends Controller {
    
    protected $userService;

    public function __construct(UserService $userService)
    {
        $this->userService = $userService;
    }

    public function index()
    {
        return view('main');
    }

    public function renderIn(Request $request)
    {
        if($request->user_id) {
            $currentUser = $this->userService->getUser($request->user_id);
            $users = $this->userService->getOtherUsers($request->user_id);
            
            return view('userTable')->with([
                        'users' => $users,
                        'currentUser' => $currentUser
                    ]);
        }
        return response()->json('user_id not provided',400);
    }


    public function renderOut()
    {
        return view('login')->with(['action'=>'logout','user'=>null]);
    }

    public function follow(Request $request)
    {
        try {
            $this->userService->follow($request->user_id1,$request->user_id2);
        } catch (\Throwable $th) {
            return response()->json('Error executing transaction',400);
        }
        
        return response()->json('success');
    }

    public function unfollow(Request $request)
    {
        try {
            $this->userService->unfollow($request->user_id1,$request->user_id2);
        } catch (\Throwable $th) {
            return response()->json('Error executing transaction',400);
        }
        
        return response()->json('success');
    }
}
