<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Contracts\Validation\Validator;



class UpdateUserRequest extends FormRequest
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
          $user =  request()->all('id');
        return [
<<<<<<< HEAD
            'name' => 'required', 
            'role_id' => 'required',
            'parent_id' => 'required',                             
=======
            'name' => 'required',
            'location_id' => 'required',
            'role_id' => 'required',
            'parent_id' => 'required',
            'address' => 'required',                            
>>>>>>> 4413c73 (removed old logs)
            'mobile' => 'required|unique:users,mobile,'.$user['id'],          
        ];

    }


    public function messages()
    {
        return [                
<<<<<<< HEAD
                'name.required' => 'Name can not be empty !', 
                'role_id.required' => 'Role ID can not be empty !',             
                'parent_id.required' => 'Parent id can not be empty !',
=======
                'name.required' => 'Name can not be empty !',
                 'location_id.required' => 'Location id can not be empty !',  
                'role_id.required' => 'Role ID can not be empty !',             
                'parent_id.required' => 'Parent id can not be empty !',
                'address.required' => 'Address can not be empty !',
>>>>>>> 4413c73 (removed old logs)
                'mobile.required' => 'Mobile number can not be empty !',                
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
