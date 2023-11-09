@extends('admin.layouts.app')
@section('content')
<div class="content-wrapper">
    <div class="page-header">
        <h3 class="page-title">
            <span class="page-title-icon bg-gradient-primary text-white me-2">
                <i class="mdi mdi-home"></i>
            </span> User
        </h3>
    </div>

    <div class="bg-light p-4 rounded">
        <h2>Add new user</h2>
        <div class="lead">
            Add new user.
        </div>

        <div class="container mt-4">

            <form method="POST" id="user_info">
                @csrf

                <div class="row">
                    <div class="col-md-6">
<<<<<<< HEAD
                        <label for="name" class="form-label">Name</label>
                        <input value="{{ old('name') }}" type="text" class="form-control" name="name" id="name" placeholder="Name">

                        <span id="name" class="text-danger text-left"></span>
                    </div>
=======
                        <div class="form-group">
                            <label for="name" class="form-label">Name</label>
                            <input value="{{ old('name') }}" type="text" class="form-control" name="name" id="name" placeholder="Name">

                            <span id="name" class="text-danger text-left"></span>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">

                            <label for="mobile" class="form-label">Mobile </label>
                            <input value="{{ old('mobile') }}" type="number" id="mobile" class="form-control" name="mobile" placeholder="mobile">

                            <span id="mobile" class="text-danger text-left"></span>
                        </div>
                    </div>

                </div>


                <div class="row">

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="email" class="form-label">Location</label>
                            <select name="location_id" id="location_id" class="form-control form-control-sm">
                                <option value=""> Pleas select location </option>
                                @foreach($locations as $location)
                                <option value="{{ $location->id}}"> {{ $location->name}} </option>
                                @endforeach
                            </select>
                            <span id="location_id" class="text-danger text-left"></span>
                        </div>
                    </div> 


                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="mobile" class="form-label">Address </label>
                            <input value="{{ old('address') }}" type="text" class="form-control" name="address" id="address" placeholder="address">

                            <span id="address" class="text-danger text-left"></span>
                        </div>
                    </div>

                </div>
                <div class="row">

>>>>>>> 4413c73 (removed old logs)
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="exampleFormControlSelect3">Role (user type)</label>

                            <select name="role_id" id="role_id" class="form-control form-control-sm">
                                <option value=""> Pleas select role </option>
                                @foreach($roles as $key=>$role)
                                <option value="{{ $role->id}}"> {{ $role->name}} </option>
                                @endforeach
                            </select>
                            <span id="role_id" class="text-danger text-left"></span>
                        </div>
                    </div>
<<<<<<< HEAD
                </div>

                <div class="row">
=======


>>>>>>> 4413c73 (removed old logs)
                    <?php $i = 0 ?>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="exampleFormControlSelect3">Parent</label>
                            <select name="parent_id" id="parent_id" class="form-control form-control-sm">
                                <option value=""> Pleas select parent </option>
                                @foreach($parents as $key=>$parent)
                                <option value="{{ $parent->id}}"> {{ $parent->name}} </option>
                                @if (count($parent->children) > 0)
                                @include('admin.users.partials.child', ['parents' => $parent->children])
                                @endif

                                @endforeach
                            </select>

                            @if ($errors->has('parent_id'))
                            <span class="text-danger text-left">{{ $errors->first('parent_id') }}</span>
                            @endif
                        </div>
                    </div>

<<<<<<< HEAD
                    <div class="col-md-6">
                        <label for="mobile" class="form-label">Mobile </label>
                        <input value="{{ old('mobile') }}" type="number" id="mobile" class="form-control" name="mobile" placeholder="mobile">

                        <span id="mobile" class="text-danger text-left"></span>
                    </div>
=======
>>>>>>> 4413c73 (removed old logs)
                </div>


                <div class="row">
                    <div class="col-md-6">
<<<<<<< HEAD
                        <label for="email" class="form-label">Email</label>
                        <input value="{{ old('email') }}" type="email" id="email" class="form-control" name="email" placeholder="Email ID">
                        <span id="email" class="text-danger text-left"></span>
                    </div>

                    <div class="col-md-6">
                        <label for="mobile" class="form-label">User Status </label>
                        <select name="status" class="form-control form-control-sm">
                            <option value="">Select Status</option>
                            <option value="0">Active</option>
                            <option value="1">Pending</option>
                        </select>

                        <span id="mobile" class="text-danger text-left"></span>
                    </div>

                </div> 

                <!-- <div class="row">

                    <div class="col-md-6">
                        <label for="mobile" class="form-label">sub congregation </label>
                        <select name="sub_congregation_id" id="sub_congregation_id" class="form-control form-control-sm">
                                <option value=""> Select sub congregation </option>
                                @foreach($subcongregations as $key=>$subcongregation)
                                <option value="{{ $subcongregation->id}}"> {{ $subcongregation->name}} </option>
                                @endforeach
                            </select>
                            <span id="sub_congregation_id" class="text-danger text-left"></span>
                    </div>

                    <div class="col-md-6">
                        <label for="mobile" class="form-label">sub congregation (care taker) </label>
                        <select name="sub_congregation_caretaker_id" id="sub_congregation_caretaker_id" class="form-control form-control-sm">
                                <option value=""> Select sub congregation </option>
                                @foreach($subcongregationcaretakers as $key=>$subcongregationcaretaker)
                                <option value="{{ $subcongregationcaretaker->id}}"> {{ $subcongregationcaretaker->name}} </option>
                                @endforeach
                            </select>
                            <span id="sub_congregation_caretaker_id" class="text-danger text-left"></span>

                        <span id="mobile" class="text-danger text-left"></span>
                    </div>

                </div> -->

=======
                        <div class="form-group">
                            <label for="email" class="form-label">Email</label>
                            <input value="{{ old('email') }}" type="email" id="email" class="form-control" name="email" placeholder="Email ID">
                            <span id="email" class="text-danger text-left"></span>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="mobile" class="form-label">User Status </label>
                            <select name="status" class="form-control form-control-sm">
                                <option value="">Select Status</option>
                                <option value="0">Active</option>
                                <option value="1">Pending</option>
                            </select>

                            <span id="mobile" class="text-danger text-left"></span>
                        </div>
                    </div>
                </div>
>>>>>>> 4413c73 (removed old logs)

                <button type="submit" class="btn btn-primary">Save</button>
                <a href="{{ route('users.index') }}" class="btn btn-default">Back</a>
            </form>
        </div>

    </div>

</div>


<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="{{asset('admin/assets/js/validation.js')}}"></script>


@stop