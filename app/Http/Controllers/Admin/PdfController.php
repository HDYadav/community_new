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
    public function downloadPDF($yearID, $monthID, SchedulerRepository $schedulerRepository)
    { 
        $days = $schedulerRepository->getAllDaysByMonth($monthID,$yearID);
        $month = $days['0']->month;
        // return view('admin.schedulers.Sample_pdf', compact('days', 'month')); 
        $pdf = PDF::loadView('admin.schedulers.Sample_pdf', compact('days', 'month'));
        return $pdf->download('speaker_list.pdf');
    }
}
