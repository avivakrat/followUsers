<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class User1FollowsUser2 extends Model
{
    protected $table = "user1_follows_user2";

    protected $fillable = [
        'user_id1', 'user_id2'
    ];

    public function user_id1()
    {
        return $this->belongsTo('App\Models\User');
    }

    public function user_id2()
    {
        return $this->belongsTo('App\Models\User');
    }
}
