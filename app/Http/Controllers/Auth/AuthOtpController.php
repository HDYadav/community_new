<?php

namespace App\Http\Controllers\Auth;
use App\Http\Controllers\ApiController;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\UserOtp;
use App\Http\Requests\OtpLoginRequest; 

class AuthOtpController extends ApiController
{
    /**
     * Write code on Method
     *
     * @return response()
     */
    // public function login()
    // {

    //     return view('auth.otpLogin');
    // }

    /**
     * Write code on Method
     *
     * @return response()
     */
    public function generate(Request $request)
    { 
        /* Validate Data */
        $request->validate([
            'mobile' => 'required'
        ]);

        /* Generate An OTP */
        $userOtp = $this->generateOtp($request->mobile);
        //dd($userOtp);
       // $userOtp->sendSMS($request->mobile);         // send otp on twillo

     // dd($userOtp);

        return $this->sucessResponse('OTP has been sent on Your Mobile Number', $userOtp, true, 201);
    }

    /**
     * Write code on Method
     *
     * @return response()
     */
    public function generateOtp($mobile)
    {

        //date_default_timezone_set("Asia/Kolkata");   //India time (GMT+5:30)
        
    
        $user = User::where('mobile', '=', $mobile)->first();   

    //  dd($user->id);
       
        /* User Does not Have Any Existing OTP */
        $userOtp = UserOtp::where('user_id', $user->id)->select('user_id','otp', 'expire_at')->latest()->first(); 

       // return $userOtp->expire_at;

        $now = now();

        if ($userOtp && $now->isBefore($userOtp->expire_at)) {
            return $userOtp;
        }

        /* Create a New OTP */
        return UserOtp::create([
            'user_id' => $user->id,
            'otp' =>rand(1000, 9999),
            'expire_at' => $now->addMinutes(10)
        ]);
    }

    /**
     * Write code on Method
     *
     * @return response()
     */
    public function verification($user_id)
    {
        return view('auth.otpVerification')->with([
            'user_id' => $user_id
        ]);
    }

    /**
     * Write code on Method
     *
     * @return response()
     */
    public function loginWithOtp(OtpLoginRequest $request)
    {

        /* Validation Logic */
        $userOtp   = UserOtp::where('user_id', $request->user_id)->where('otp', $request->otp)->first();

        $now = now();
        if (!$userOtp) {
            return $this->errorResponse('Your Otp is not correct', 422);
        } else if ($userOtp && $now->isAfter($userOtp->expire_at)) {
            return $this->errorResponse('Your OTP has been expired', 402);
        }

        $user = User::whereId($request->user_id)->first(); 
         
        if ($user) {

            $userOtp->update([
                'expire_at' => now()
            ]);

          // Auth::login($user);

          // $token = $this->tokenHeader($user->createToken('MyApp')->accessToken);

           $token = $user->createToken('MyApp')->accessToken;

            return $this->sucessResponse('OTP has been sucessfully verified', $token, true, 201);
        }

        return $this->errorResponse('Your Otp is not correct', 402);
    }
}
