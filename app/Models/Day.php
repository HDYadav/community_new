<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Day extends Model
{
    use HasFactory;
    
    public $timestamps = false;

    protected $fillable = [
        'year_id',
        'month_id',
        'date',
        'day'
    ];
}
