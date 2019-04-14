(*
Copyright (c) 2019 Ilya Sergey

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*)

include Points

(* Some utility functions *)
let rec all_pairs ls = match ls with
  | [] -> []
  | _ :: [] -> []
  | h1 :: h2 :: t -> (h1, h2) :: (all_pairs (h2 :: t))    

let rec all_triples ls = 
  let (a, b) = (List.hd ls, List.hd @@ List.tl ls) in
  let rec walk l = match l with
    | x :: y :: [] -> [(x, y, a); (x, a, b)]
    | x :: y :: z :: t -> (x, y, z) :: (walk (y :: z :: t))    
    | _ -> []
  in
  assert (List.length ls >= 3);
  walk ls

(* Remove duplicates *)
let uniq lst =
  let seen = Hashtbl.create (List.length lst) in
  List.filter (fun x -> let tmp = not (Hashtbl.mem seen x) in
                        Hashtbl.replace seen x ();
                        tmp) lst

(******************************************)
(*             Polygons                   *)
(******************************************)

type polygon = point list 

let polygon_of_int_pairs l = 
  List.map (fun (x, y) -> 
      Point (float_of_int x, float_of_int y)) l

let shift_polygon (dx, dy) pol = 
  (* TODO: implement me *)
  pol



(******************************************)
(*             Render Polygons            *)
(******************************************)

let draw_polygon ?color:(color = Graphics.black) p = 
  let open Graphics in
  set_color color;
  List.map (function Point (x, y) -> 
    (int_of_float x + fst origin, 
     int_of_float y + snd origin)) p |>
  Array.of_list |>
  draw_poly;
  set_color black

(******************************************)
(*             Test Polygons              *)
(******************************************)

module TestPolygons = struct

  let triangle = 
    [(-50, 50); (200, 0); (200, 200)] |> polygon_of_int_pairs

  let square = [(100, -100); (100, 100); (-100, 100); (-100, -100)] |> polygon_of_int_pairs

  let convexPoly2 = [(100, -100); (200, 200); (0, 200); (0, 0)] |> polygon_of_int_pairs

  let convexPoly3 = [(0, 0); (200, 0); (200, 200); (40, 100)] |> polygon_of_int_pairs

  let simpleNonConvexPoly = [(0, 0); (200, 0); 
                             (200, 200); (100, 50)] |> polygon_of_int_pairs

  let nonConvexPoly5 = [(0, 0); (0, 200); 
                        (200, 200); (-100, 300)] |> 
                       polygon_of_int_pairs |>
                       shift_polygon (-50., -100.)

  let bunnyEars  = [(0, 0); (400, 0); (300, 200); 
                    (200, 100); (100, 200)] |> 
                   polygon_of_int_pairs |>
                   shift_polygon (-100., -50.)

  let lShapedPolygon = [(0, 0); (200, 0); (200, 100); 
                        (100, 100); (100, 300); (0, 300)]  
                       |> polygon_of_int_pairs
                       |> shift_polygon (-150., -150.)

  let kittyPolygon = [(0, 0); (500, 0); (500, 200); 
                      (400, 100); (100, 100); (0, 200)] 
                     |> polygon_of_int_pairs
                     |> shift_polygon (-250., -150.)

  let simpleStarPolygon = [(290, 0); (100, 100); (0, 290); 
                           (-100, 100); (-290, 0); (-100, -100); 
                           (0, -290); (100, -100)]  |> polygon_of_int_pairs

  let weirdRectPolygon = [(0, 0); (200, 0); (200, 100); (100, 100); 
                          (100, 200); (300, 200); (300, 300); (0, 300)]  
                         |> polygon_of_int_pairs
                         |> shift_polygon (-150., -150.)

  let sand4 = [(0, 0); (200, 0); (200, 100); (170, 100); 
               (150, 40); (130, 100); (0, 100)] 
              |> polygon_of_int_pairs
              |> shift_polygon (-30., -30.)

  let tHorror = [(100, 300); (200, 100); (300, 300); 
                 (200, 300); (200, 400)]  
                |> polygon_of_int_pairs
                |> shift_polygon (-250., -250.)


  let chvatal_comb = [(500, 200); (455, 100); (400, 100);
                      (350, 200); (300, 100); (250, 100);
                      (200, 200); (150, 100); (100, 100);
                      (50, 200); (0, 0); (500, 0)]
                     |> polygon_of_int_pairs
                     |> shift_polygon (-200., -70.)
                       

  let chvatal_comb1 = [(500, 200); (420, 100); (400, 100);
                       (350, 200); (300, 100); (250, 100);
                       (200, 200); (150, 100); (100, 100);
                       (50, 200); (0, 70); (500, 70)]  
                      |> polygon_of_int_pairs
                      |> shift_polygon (-200., -70.)

  let shurikenPolygon = [(390, 0); (200, 50); (0, 290); 
                         (50, 150); (-200, -100); (0, 0)]  
                        |> polygon_of_int_pairs
                        |> shift_polygon (-80., -70.)


                                      
end

(******************************************)
(*       Manipulating with polygons       *)
(******************************************)

let resize_polygon k pol = 
  (* TODO: implement me *)
  raise (Failure "Implement me!")

(* What if k is negative? *)

let rotate_polygon pol p0 angle = 
  (* TODO: implement me *)
  raise (Failure "Implement me!")

(******************************************)
(*         Queries about polygons         *)
(******************************************)


(* Checking whether a polygon is convex *)
let is_convex pol = 
  let triplets = all_triples pol in
  (* TODO: implement me *)
  raise (Failure "Implement me!")


(* TODO: Check the tests *)

(* Detecting collisions *)

let edges pol = 
  if pol = [] then []
  else 
    let es = all_pairs pol in
    let lst = List.rev pol |> List.hd in
    let e = (lst, List.hd pol) in
    e :: es

let polygons_touch_or_intersect pol1 pol2 =
  let es1 = edges pol1 in
  let es2 = edges pol2 in
  (* TODO: implement me *)
  raise (Failure "Implement me!")

(* Question: what is the complexity of this? *)

(* TODO:

Play with multiple polygons, e.g., scaled and rotated kitty
*)

(******************************************)
(*        Intersection with a ray         *)
(******************************************)

type ray = point * float

let draw_ray ?color:(color = Graphics.black) r = 
  let (p, phi) = r in
  let open Graphics in
  let q = p ++ (2000. *. (cos phi), 2000. *. (sin phi)) in
  draw_segment ~color (p, q)

(* ??? What is happening here??? *)

let point_on_ray ray p = 
  let (q, phi) = ray in
  (* Ray's direction *)
  let r = Point (cos phi, sin phi) in
  let u = dot_product (p -- q) r in
  u >=~ 0.

let ray_segment_intersection ray seg = 
  let (p, p') = seg in
  let (q, phi) = ray in
  (* Segment's direction *)
  let s = Point (get_x p' -. get_x p, get_y p' -. get_y p) in
  (* Ray's direction *)
  let r = Point (cos phi, sin phi) in

  if cross_product s r =~= 0. then
    if cross_product (p -- q) r =~= 0.
    then if point_on_ray ray p then Some p 
      else if point_on_ray ray p' then Some p'
      else None
    else None
  else begin
    (* TODO: implement me *)
    raise (Failure "Implement me!")
  end


(******************************************)
(*        Point within an polygon         *)
(******************************************)

(* Get neightbors of a vertex *)
let get_vertex_neighbours pol v = 
  assert (List.mem v pol);

  let arr = Array.of_list pol in
  let n = Array.length arr in
  assert (Array.length arr >= 3);

  if v = arr.(0) then (arr.(n - 1), arr.(1))
  else if v = arr.(n - 1) then (arr.(n - 2), arr.(0))
  else let rec walk i = 
         if i = n - 1 then (arr.(n - 2), arr.(0))
         else if v = arr.(i) 
         then (arr.(i - 1), arr.(i + 1))
         else walk (i + 1)
    in walk 1

(* Question how to determine it? *)

(* Get neightbors of a vertex *)
let neighbours_on_different_sides ray pol p =
  if not (List.mem p pol) then true
  else
    let (a, b) = get_vertex_neighbours pol p in
    let (r, d) = ray in 
    (* TODO: implement me *)
    raise (Failure "Implement me!")


(* Point within a polygon *)

let point_within_polygon pol p = 
  let ray = (p, 0.) in
  let es = edges pol in
  if List.mem p pol ||
     List.exists (fun e -> point_on_segment e p) es then true
  else
    begin
      let n = 0
        (* TODO: Computer intersection with edges *)

        (* TODO: Remembertouching edges *)

        (* TODO: Remember touching vertices *)

        (* TODO: Compute length *)
      in
      n mod 2 = 1
    end

(*
TODO: Test with the following points

let pol = TestPolygons.sand4;;

let q = Point (50., 10.);; 
(* true *)

let p = Point (-150., 10.);; 
(* false *)

let r = Point (-150., 70.);; 
(* false *)

let s = Point (120., 70.);; 
(* false *)


*)

