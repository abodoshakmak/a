<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use app\Models\Post;
use app\Models\like;
require_once app_path('Models/Post.php');
class LikeController extends Controller
{
    //like or dislike
    public function likeOrUnlike($id){
        $post=Post::find($id);
        if(!$post)
        {
            return response([
                'messge'=>'post not found.'
            ],403);
        }
        $like = $post->likes()->where('user_id', auth()->user()->id)->first();
        //if not like then
        if(!$like)
        {
            Like::create([
                'post_id'=>$id,
                'user_id'=>auth()->user()->id
            ]);
            return response([
                'message'=>'Liked'
            ],200);
        }
        //else dislkie
        $like->delete();
        return response([
            'message'=>'Disliked'
        ],200);

        
    }
}
