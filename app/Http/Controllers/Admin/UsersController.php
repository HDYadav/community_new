<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User; 
use App\Http\Requests\StoreUserRequest;
use App\Http\Requests\UpdateUserRequest;
use App\Repository\UserRepository;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\DB;
//use Illuminate\Support\Facades\Auth;
 


class UsersController extends Controller
{

    private static $superAdmin='0';

    private static $subCongregation='4'; // 4 is subcongregation id ie. care taker
    private static $subCongregationCaretaker='5'; // 5 is subCongregationCaretaker id ie. sub care taker
    

    /**
     * Display all users
     * 
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, UserRepository $userRepository)
    {
    
        if ($request->ajax()) {

            $users = $userRepository->getUsers($request);
            return Datatables::of($users)
                ->addIndexColumn()
                ->addColumn('action', function ($row) {
                    $edit_icon=asset("admin/assets/images/icon/edit-8-64.png"); 
                    $del_icon=asset("admin/assets/images/icon/delete-icon.png");
<<<<<<< HEAD
                    $btn = "<a class='edit btn btn-sm' href='users/$row->id/edit'><img src=$edit_icon></a>   <a alt='Delete' onclick='deletess($row->id)'><img src=$del_icon height='50%' width='50%'></a></a>";
=======
                    $btn = "<a class='edit btn btn-sm' href='users/$row->id/edit'><img src=$edit_icon height='25%' width='25%'></a>   <a alt='Delete' onclick='deletess($row->id)'><img src=$del_icon height='25%' width='25%'  ></a>";
>>>>>>> 4413c73 (removed old logs)
                    return $btn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        return view('admin.users.index');
    }

    /**
     * Show form for creating user
     * 
     * @return \Illuminate\Http\Response
     */
    public function create(UserRepository $userRepository)
    {
        //  $roles = Role::orderBy('id','ASC')->pluck('name', 'id');  
        
        $roles = $userRepository->getRoles();
        $parents = $userRepository->getAllCategoriesWithChildren(User::all(),Self::$superAdmin);  // Get all paret and child  

        $subcongregations = $userRepository->sub_congregation(self::$subCongregation);
        $subcongregationcaretakers = $userRepository->sub_congregation(self::$subCongregationCaretaker);

<<<<<<< HEAD
        return view('admin.users.create', compact('roles','parents','subcongregations','subcongregationcaretakers'));
=======
        $locations = $userRepository->getLocations();

        return view('admin.users.create', compact('roles','parents','subcongregations','subcongregationcaretakers', 'locations'));
>>>>>>> 4413c73 (removed old logs)
    }

    /**
     * Store a newly created user
     * 
     * @param User $user
     * @param StoreUserRequest $request
     * 
     * @return \Illuminate\Http\Response
     */
    public function store(StoreUserRequest $request, UserRepository $userRepository)
    {  
        try {
            DB::beginTransaction(); 
            $userRepository->create($request);
            DB::commit(); 
            return response()->json(['data' =>'true']);
            // return redirect()->route('users.index')
            //     ->withSuccess(__('User created successfully.'));
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['errors' => $e->getMessage()]);
        }
    }

 
    /**
     * Edit user data
     * 
     * @param User $user
     * 
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user, UserRepository  $userRepository)
    {
        //$userRepository->userWithoutSA();
        $roles = $userRepository->getRoles();
        $parents = $userRepository->getAllCategoriesWithChildren(User::all(), Self::$superAdmin);  // Get all paret and child 
<<<<<<< HEAD
=======
        $locations = $userRepository->getLocations();
>>>>>>> 4413c73 (removed old logs)
     
      
        return view('admin.users.edit', [
            'user' => $user,
            'userRole' => $user->roles->pluck('name')->toArray(),
            'roles' => $roles,
            'parents' =>  $parents,
            'role_id' => $user->roles->first()->id,
            'parent_id' => $user->parent_id,
<<<<<<< HEAD
=======
            'locations' => $locations,
>>>>>>> 4413c73 (removed old logs)
        ]);
    }

    /**
     * Update user data
     * 
     * @param User $user
     * @param UpdateUserRequest $request
     * 
     * @return \Illuminate\Http\Response
     */
    public function update(UserRepository $userRepository, UpdateUserRequest $request)
    { 
       
        try {
            DB::beginTransaction(); 
           
            $user = $userRepository->update($request);
            DB::commit(); 
          return response()->json(['data' =>'true']);
           
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['errors' => $e->getMessage()]);
        } 

    }

    /**
     * Delete user data
     * 
     * @param User $user
     * 
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        $user->delete();

        return redirect()->route('users.index')
            ->withSuccess(__('User deleted successfully.'));
    }


    public function delete(Request $request)
    {

        try {
            $input = $request->all();

            $input = request()->except(['_token']);

            DB::table('users')->where('id', $input['id'])->delete();

            // $input['updated_by'] = Auth::id();
            // $res = Insurer::where('id', $input['id'])->update($input);
            $msg = 'User successfully deleted';
            return ['status' => true, 'message' => $msg];
        } catch (\Exception $exe) {
            return ['status' => 'false', 'message' => $exe->getMessage()];
        }
    }
}
