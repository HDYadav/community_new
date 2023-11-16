<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Repository\SchedulerRepository;
use App\Models\Scheduler;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Collection;
use Barryvdh\DomPDF\Facade\Pdf;

class PdfController extends Controller
{
    public function downloadPDF(Request$request, SchedulerRepository $schedulerRepository)
    {
        $collection = $schedulerRepository->getAllDaysByMonth($request->m_id, $request->year);  

        dd($collection);
        $data = [
            "full_name" => "john do",
            "email" => "john@example.com",
            "age" => "23",
            "phone" => "998877XXXX",
        ];

       
         $pdf = PDF::loadView('admin.schedulers.Sample_pdf', $data);
        
        return $pdf->download('teknowize.pdf');
    }
}
