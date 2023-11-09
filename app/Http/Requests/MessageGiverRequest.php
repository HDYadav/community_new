<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Contracts\Validation\Validator;

class MessageGiverRequest extends FormRequest
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
            'subject' => 'required',
            'message' => 'required',            
            'message_giver_id' => 'required',   
            'care_taker_id' => 'required',  
            'start_date' => 'required',  
            'end_date' => 'required',     
        ];
    }

    public function messages()
    {
        return [
                'subject.required' => 'Subject can not be empty !',
                'message.required' => 'Message can not be empty !',  
                'message_giver_id.required' => 'Message giver can not be empty !',
                'care_taker_id.required' => 'Care taker can not be empty !', 
                'start_date.required' => 'Start date can not be empty !',
                'end_date.required' => 'End date can not be empty !',                
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
