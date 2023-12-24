<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class SaveSchedulerRequest extends FormRequest
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
            'year_id' => 'required',
            'month_id' => 'required',
            'city' => 'required',
            'member' => 'required',
            'dayIDs' => 'required' 
            
        ];
    }

    public function messages()
    {
        return [
            'year_id.required' => 'Year id can not be empty!',
            'month_id.required' => 'Month id can not be empty!',
            'city.required' => 'City can not be empty!',
            'member.required' => 'Member can not be empty!',
            'dayIDs.required' => 'Day can not be empty!',
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
