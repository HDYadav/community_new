<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Scheduler extends Model
{
    use HasFactory;

    protected $fillable = [
        'days_id',
        'city_id',
        'user_id' ,
        'status'   
    ];

    const STATUS_DRAFT = 'draft';
    const STATUS_PUBLISHED = 'published';

}
