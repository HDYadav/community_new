<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Contracts\Validation\Validator;

class RegistraionRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'full_name' => 'required',            
            'mobile' => 'required|unique:users,mobile',  
            'sub_congregation_id' => 'required',
            'sub_congregation_caretaker_id' => 'required',
        ];
    }

    public function messages()
    {
        return [
                'name.required' => 'Name can not be empty !',  
                'mobile.required' => 'Mobile number can not be empty !',
                'sub_congregation_id.required' => 'Sub-Congregation Name can not be empty !',
                'sub_congregation_caretaker_id.required' => 'Sub-congregation Caretaker Name can not be empty !',                 
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
