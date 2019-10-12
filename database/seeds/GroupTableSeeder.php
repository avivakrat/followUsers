<?php

use Illuminate\Database\Seeder;
use Carbon\Carbon;

class GroupTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $groups = ["Art","Music","PC","Football","Finance"];
        
        foreach ($groups as $group_name) {
            DB::table('groups')->insert([
                'name' => $group_name,
                'created_at' => Carbon::now(),
            ]);
        }
        
    }
}
