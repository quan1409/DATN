<?php

namespace App\Http\Controllers\TiktokApi;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

//use model
use App\Models\TiktokApi\Comments;
use App\Http\Controllers\TiktokApi\LikeCommentController;

class CommentController extends Controller
{
    //
    public function save_comment(Request $request){
        $comment = new Comments();
        $comment->content = $request->content;
        $comment->user_id = $request->user_id;
        $comment->video_id = $request->video_id;
        $comment->save();
        return response()->json([
            'alert' => 200,
        ]);
    }

    public function load_comments(Request $request){
        $all_comment = Comments::all();
        $array = [];
        $array_count = [];
        $array_check = [];
        $n = 0;
        for ($x = 0; $x < count($all_comment); $x++){
            if ($all_comment[$x]->video_id == $request->video_id){
                $array[$n] = $all_comment[$x];
                $array_count[$n] = LikeCommentController::count_like_comment($all_comment[$x]->id);
                $array_check[$n] = LikeCommentController::check_cmt($request->user_id, $all_comment[$x]->id);
                $n++;
            }
        }
        return response()->json([
            'alert' => 200,
            'data' => $array,
            'data_count' => $array_count,
            'data_check' => $array_check,
        ]);
    }
}
