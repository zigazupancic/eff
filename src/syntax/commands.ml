module Sugared = SugaredSyntax

(* Toplevel commands (the first four do not need to be separated by [;;]) *)
type t = (plain_command * Location.t)

and plain_command =
  | Tydef of (OldUtils.tyname, OldUtils.typaram list * Sugared.tydef) Assoc.t
      (** [type t = tydef] *)
  | TopLet of (Sugared.variable Sugared.pattern * Sugared.term) list
      (** [let p1 = t1 and ... and pn = tn] *)
  | TopLetRec of (Sugared.variable * Sugared.term) list
      (** [let rec f1 p1 = t1 and ... and fn pn = tn] *)
  | External of (Sugared.variable * Sugared.ty * Sugared.variable)
      (** [external x : t = "ext_val_name"] *)
  | DefEffect of (Sugared.effect * (Sugared.ty * Sugared.ty))
      (** [effect Eff : ty1 -> t2] *)
  | Term of Sugared.term
  | Use of string  (** [#use "filename.eff"] *)
  | Reset  (** [#reset] *)
  | Help  (** [#help] *)
  | Quit  (** [#quit] *)
  | TypeOf of Sugared.term  (** [#type t] *)
