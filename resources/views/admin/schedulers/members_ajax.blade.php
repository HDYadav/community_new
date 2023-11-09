<table class="table table-bordered table-schedule">
    <thead>
        <tr>
            <td>Name</td>
            <td>Mobile No</td>
            <td>Address</td>
        </tr>
    </thead>

    <tbody>
        @foreach($members as $member)
        <tr>
            <td>{{@$member->name}}</td>
            <td>{{@$member->mobile}}</td>
            <td>{{@$member->address}}</td>
        </tr>
        @endforeach
    </tbody>
</table>