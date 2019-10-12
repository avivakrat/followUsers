<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/','UserController@index')->name('main');

Route::post('users/follow','UserController@follow')->name('follow');
Route::post('users/unfollow','UserController@unfollow')->name('unfollow');

Route::post('users/render-in','UserController@renderIn')->name('renderIn');
Route::post('users/render-out','UserController@renderOut')->name('renderOut');