<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\RegisterController;
use App\Http\Controllers\ApiController;
use App\Http\Controllers\Api\ProfileController;
use App\Http\Controllers\API\ApiSchedulerController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/


Route::controller(App\Http\Controllers\Auth\AuthOtpController::class)->group(function(){
    //Route::get('otp/login', 'login')->name('otp.login');
    Route::post('otp/generate', 'generate')->name('otp.generate');
    Route::get('otp/verification/{user_id}', 'verification')->name('otp.verification');
    Route::post('otp/login', 'loginWithOtp')->name('otp.getlogin');
   // Route::post('otp/login', 'loginWithOtp')->name('otp.getlogin');
});


Route::post('get_zipcode', [ApiController::class, 'getpincode']); 


Route::post('register', [RegisterController::class, 'register']);
Route::post('login', [RegisterController::class, 'login']);

// Route::post('register', [RegisteredUserController::class, 'store']);
 // Route::post('login', [RegisteredUserController::class, 'login']);


Route::group(['middleware' => 'auth:api'], function () {

    Route::post('profile', [ProfileController::class, 'index']);

    Route::get('get_years', [ApiSchedulerController::class, 'getYears']);
    Route::get('get_cities', [ApiSchedulerController::class, 'getcities']);
    Route::get('get_users', [ApiSchedulerController::class, 'getUsers']);
    Route::post('get_months', [ApiSchedulerController::class, 'getMonths']);
    Route::post('/all_days ', [ApiSchedulerController::class, 'getAllMDays']);

    Route::post('/sch_update ', [ApiSchedulerController::class, 'schUpdate']);

    
});




// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });
