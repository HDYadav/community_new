<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MessageGiver extends Model
{
    use HasFactory;

    protected $table = 'tasks';

     /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [       
        'message_giver_id',
        'care_taker_id',        
        'task_start_date',
        'task_end_date',
        'subject',
        'message',   
        'assigned_by'
    ];

}
