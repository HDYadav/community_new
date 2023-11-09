<?php

namespace App\Http\Controllers;
use App\Traits\ApiResponser;
use Illuminate\Http\Request;


class ApiController extends Controller
{
    use ApiResponser; 

    public function tokenHeader($accessToken){

      return  $headers = [
            'Content-Type' => 'application/json',
            'Authorization' => $accessToken
            //'Authorization' => 'Bearer ' . $accessToken
        ];
    }

    public function getpincode(Request $request)
    {
        try {
            
            $pincode = $request->zip_code;
            $curl = curl_init();
            curl_setopt_array($curl, array(
                CURLOPT_URL => 'https://api.postalpincode.in/pincode/' . $pincode,
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'GET',
            ));
            $response = curl_exec($curl);
            curl_close($curl);
            $decodedData = json_decode($response, true);
            if ($decodedData['0']['Status'] == 'Error') {
                throw new \Exception($decodedData['0']['Message']);
            }

            $array = ['city' => $decodedData['0']['PostOffice']['0']['District'], 'state' => $decodedData['0']['PostOffice']['0']['State']];

            return $this->sucessResponse('Records Sucessfully fetched', $array, true, 201);

          //  return response()->json(['status' => true, 'data' => ['city' => $decodedData['0']['PostOffice']['0']['District'], 'state' => $decodedData['0']['PostOffice']['0']['State'], 'Result' => $decodedData['0']['PostOffice']]]);
        } catch (\Exception $exe) {
            return $this->errorResponse($exe->getMessage(), $exe->getCode());

         //   return  response()->json(['status' => false, 'message' => $exe->getMessage(), 'status_code' => $exe->getCode()]);
        }
    }

}
