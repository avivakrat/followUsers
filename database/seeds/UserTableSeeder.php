<?php

use Illuminate\Database\Seeder;
use Carbon\Carbon;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $users = ["Mike","Bob","Larry","Julia","Anna","Ruth","Mira","John","Christy","Lola","Pola"];
        foreach ($users as $user_name) {
            DB::table('users')->insert([
                'name' => $user_name,
                'group_id' => mt_rand(1, 5),
                'followers_count' => 0,
                'created_at' => Carbon::now(),
            ]);
        }
    }
}
