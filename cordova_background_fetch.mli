module Config : sig
  type t

  val create :
    ?minimumFetchInterval:(int [@js.default 15]) ->
    ?delay:int ->
    ?periodic:(bool [@js.default false]) ->
    ?requiredNetworkType:int ->
    unit ->
    t
    [@@js.builder]
end

val configure :
  fetch:(string -> unit) ->
  failure:(string -> unit) ->
  Config.t ->
  unit
[@@js.global "BackgroundFetch.configure"]

val finish :
  taskId:string ->
  success:(int -> unit) ->
  failure:(int -> unit) ->
  unit
[@@js.global "BackgroundFetch.finish"]

val start : success:(int -> unit) -> failure:(int -> unit) -> unit
[@@js.global "BackgroundFetch.start"]

val stop : success:(int -> unit) -> failure:(int -> unit) -> unit
[@@js.global "BackgroundFetch.stop"]

val status : (int -> unit) -> unit
[@@js.global "BackgroundFetch.status"]
