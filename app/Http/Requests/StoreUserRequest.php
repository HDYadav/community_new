<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Contracts\Validation\Validator;

class StoreUserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'role_id' => 'required',
<<<<<<< HEAD
            'name' => 'required',            
            'mobile' => 'required|numeric|digits:10|unique:users,mobile',   
=======
            'location_id' => 'required',
            'name' => 'required',            
            'mobile' => 'required|numeric|digits:10|unique:users,mobile',
            'address' => 'required',  
>>>>>>> 4413c73 (removed old logs)
            'status' => 'required',         
        ];
    }


    public function messages()
    {
        return [
                'role_id.required' => 'Role ID can not be empty !',
<<<<<<< HEAD
                'name.required' => 'Name can not be empty !',  
                'mobile.required' => 'Mobile number can not be empty !',
=======
                'location_id.required' => 'Location id can not be empty !',  
                'name.required' => 'Name can not be empty !',  
                'mobile.required' => 'Mobile number can not be empty !',
                'address.required' => 'Address can not be empty !',
>>>>>>> 4413c73 (removed old logs)
                'status.required' => 'User Status can not be empty !',                 
        ];
    }

    public function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(response()->json([
            'success'   => false,
            'message'   => 'Validation errors',
            'data'      =>  $validator->getMessageBag()->toArray()
        ], 201));

    }


}
