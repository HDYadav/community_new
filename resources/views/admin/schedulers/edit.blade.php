@extends('admin.layouts.app')
@section('content')

<div class="content-wrapper">
    <div class="page-header">
        <h3 class="page-title">
            <span class="page-title-icon bg-gradient-primary text-white me-2">
                <i class="mdi mdi-home"></i>
            </span>Edit Schedulers
        </h3>
    </div>

    <div class="mt-2">
        @include('admin.layouts.partials.messages')
    </div>

    <div class="col-lg-12 stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Schedulers Managment System</h4>

                <form method="post" action="{{route('schedulers.update')}}">
                    @csrf

                    <table class="table table-bordered">
                        <thead>
                            <tr>

                                <th class="form-label">Select the Year</th>
                                <th>
                                    <select name="year" id="year" class="form-control form-control-sm" disabled>
                                        <option value="">Select Year</option>
                                        @foreach($years as $year)
                                        <option value="{{ $year->id}}" <?php if ($year->id == $scheduler['0']->year_id) {
                                                                            echo "selected";
                                                                        } ?>> {{ $year->year}} </option>
                                        @endforeach
                                    </select>
                                </th>
                                <th class="form-label">Select the Month</th>
                                <th>
                                    <select class="form-control form-control-sm" id="month_id" name="month_id" disabled>
                                        <option value="">Select Month</option>
                                        <option value="">Select Year</option>
                                        @foreach($months as $month)
                                        <option value="{{ $month->id}}" <?php if ($month->id == $scheduler['0']->month_id) {
                                                                            echo "selected";
                                                                        } ?>> {{ $month->month}} </option>
                                        @endforeach
                                    </select>
                                </th>

                            </tr>
                        </thead>
                    </table>
                    <div id="scheduler">

                        <table class="table table-bordered table-schedule">
                            <tbody>

                                <tr class="table-info">
                                    <th colspan="2" align="center"><strong> Sunday <?php echo $scheduler['0']->date; ?> </strong> </th>

                                <tr>

                                    <td colspan="2">
                                        <table width="100%">
                                            <tr>
                                                <td><strong>SN.</strong> </td>
                                                <td><strong>Place</strong> </td>
                                                <td><strong>Speaker</strong> </td>
                                            </tr>
                                            <?php

                                            foreach ($scheduler as $key => $scheduler) {
                                                $members = json_decode(getUsers());

                                            ?>
                                                <tr>
                                                    <td> <?php echo $scheduler->id; ?> </td>
                                                    <td>

                                                        <a data-toggle="modal" data-target="#myModal" id="<?php echo "cityId_" . $scheduler->id; ?>" onclick="showModal(this.id)" data-num="0"><?php echo $scheduler->city_name; ?> </a>

                                                        <input type="hidden" name="city[]" value="{{ $scheduler->city_id}}">
                                                        <input type="hidden" value="{{$scheduler->days_id}}" name="dayIDs">
                                                    </td>

                                                    <td>
                                                        <select name="member[]" id="member" class="form-control form-control-sm">

                                                            <option value="">Select speaker</option>
                                                            <?php
                                                            foreach ($members as $member) {
                                                            ?>
                                                                <option value="<?php echo $member->id ?>" <?php if ($member->id == $scheduler->user_id) {
                                                                                                                echo "selected";
                                                                                                            } ?>><?php echo $member->name ?></option>
                                                            <?php } ?>

                                                        </select>
                                                    </td>
                                                </tr>

                                            <?php    } ?>

                                        </table>
                                    </td>

                                </tr>

                            </tbody>
                        </table>


                    </div>
                    <button type="submit" class="btn btn-primary">Update</button>
                </form>

            </div> <!-- card Body -->
        </div>
    </div>

</div>

<script src="{{asset('admin/assets/js/editAjaxRequest.js')}}"></script>


@stop