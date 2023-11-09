<?php

namespace App\Contracts;

use Illuminate\Http\Request;

interface VendorInterface
{
    public function create(Request $request);

    public function img_upload(Request $request);
     
}
