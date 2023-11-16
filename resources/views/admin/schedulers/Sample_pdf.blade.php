<!DOCTYPE html>
<html>

<head>
    <title>laravel-pdf</title>
    <style>
        table tr th {
            background-color: #808080;
            color: white;
            border: 1px solid #ddd;
            padding: 8px;
        }

        table tr td {
            border: 1px solid #ddd;
            padding: 8px;
        }
    </style>
</head>

<body>
    <h3>Word of God - List (Speakers list) - {{$month}} </h3>

    @foreach ($days as $key => $day)

    <?php
    $i = 1;
    ?>

    <table class="table table-bordered table-schedule">
        <tbody>
            <tr>
                <th>Sr. No</th>
                <th>Date</th>
                <th>Place</th>
                <th>Speaker</th>
            </tr>
        </tbody>

        <?php

        $usersCitys = getSchedular($day->id);

        ?>
        @foreach ($usersCitys as $key => $usersCity)
        <tr>
            <td>{{$i}} </td>
            <td> <?php if($i==1){?>{{$day->date}} <?php }?></td>
            <td>{{@$usersCity->city_name}}</td>
            <td>{{@$usersCity->name}}</td>
        </tr>
        <?php $i++; ?>

        @endforeach

    </table>


    @endforeach
</body>

</html>