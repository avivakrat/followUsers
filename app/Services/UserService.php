<?php

namespace App\Services;

use App\Models\User;
use App\Models\User1FollowsUser2;
use Illuminate\Support\Facades\DB;

class UserService {

    /*
    * Get user details
    *
    */

    public function getUser($user_id)
    {
        return User::find($user_id);
    }

    /*
    * Get other users along with their group info and followers count 
    *
    */
    public function getOtherUsers($user_id)
    {
        return DB::select('SELECT users.id,users.name as user_name,
        users.followers_count, 
        groups.name as group_name,
        f.user_id2 as follows
                FROM users 
                JOIN groups on groups.id = users.group_id 
                LEFT JOIN user1_follows_user2 f
                    ON f.user_id1 = ? and f.user_id2 = users.id
                WHERE users.id <> ?
                ORDER BY users.name',[$user_id,$user_id]);
    }

    /*
    * Set user1 to follow user2 and update followers count
    *
    */
    public function follow($user_id1,$user_id2) 
    {
        DB::transaction(function () use ($user_id1,$user_id2) {
            User1FollowsUser2::create([
                'user_id1' => $user_id1,
                'user_id2' => $user_id2
            ]);
        
            User::where('id',$user_id2)->increment('followers_count');
        });
    }

    /*
    * Set user1 to unfollow user2 and update followers count
    *
    */
    public function unfollow($user_id1,$user_id2) 
    {
        DB::transaction(function () use ($user_id1,$user_id2) {
            User1FollowsUser2::where('user_id1',$user_id1)->where('user_id2',$user_id2)->delete();

            User::where('id',$user_id2)->decrement('followers_count');
        });
    }
}