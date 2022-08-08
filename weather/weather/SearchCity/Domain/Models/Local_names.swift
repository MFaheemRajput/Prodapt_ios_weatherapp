import Foundation
struct Local_names : Codable {
	let ht : String?
	let sc : String?
	let de : String?
	let ta : String?
	let mk : String?
	let gv : String?
	let mt : String?
	let no : String?
	let yi : String?
	let li : String?
	let ko : String?
	let hu : String?
	let fi : String?
	let et : String?
	let ka : String?
	let te : String?
	let cs : String?
	let zu : String?
	let kv : String?
	let mn : String?
	let ca : String?
	let kn : String?
	let lo : String?
	let ky : String?
	let kk : String?
	let tr : String?
	let sk : String?
	let eo : String?
	let mi : String?
	let an : String?
	let gn : String?
	let cy : String?
	let gl : String?
	let hy : String?
	let or : String?
	let fy : String?
	let wo : String?
	let sq : String?
	let ga : String?
	let cv : String?
	let pl : String?
	let sa : String?
	let be : String?
	let ro : String?
	let af : String?
	let feature_name : String?
	let hi : String?
	let ar : String?
	let kw : String?
	let bo : String?
	let sl : String?
	let ne : String?
	let fr : String?
	let tg : String?
	let ru : String?
	let pt : String?
	let mr : String?
	let ja : String?
	let br : String?
	let sr : String?
	let ur : String?
	let vi : String?
	let en : String?
	let my : String?
	let yo : String?
	let gd : String?
	let cu : String?
	let th : String?
	let nl : String?
	let sv : String?
	let ku : String?
	let ascii : String?
	let am : String?
	let oc : String?
	let it : String?
	let es : String?
	let bg : String?
	let zh : String?
	let rm : String?
	let si : String?
	let fa : String?
	let ml : String?
	let gu : String?
	let lv : String?
	let uk : String?
	let el : String?
	let ps : String?
	let ba : String?
	let he : String?
	let ln : String?
	let ab : String?
	let bn : String?
	let eu : String?
	let lt : String?
	let co : String?
	let os : String?
	let tt : String?
	let tl : String?

	enum CodingKeys: String, CodingKey {

		case ht = "ht"
		case sc = "sc"
		case de = "de"
		case ta = "ta"
		case mk = "mk"
		case gv = "gv"
		case mt = "mt"
		case no = "no"
		case yi = "yi"
		case li = "li"
		case ko = "ko"
		case hu = "hu"
		case fi = "fi"
		case et = "et"
		case ka = "ka"
		case te = "te"
		case cs = "cs"
		case zu = "zu"
		case kv = "kv"
		case mn = "mn"
		case ca = "ca"
		case kn = "kn"
		case lo = "lo"
		case ky = "ky"
		case kk = "kk"
		case tr = "tr"
		case sk = "sk"
		case eo = "eo"
		case mi = "mi"
		case an = "an"
		case gn = "gn"
		case cy = "cy"
		case gl = "gl"
		case hy = "hy"
		case or = "or"
		case fy = "fy"
		case wo = "wo"
		case sq = "sq"
		case ga = "ga"
		case cv = "cv"
		case pl = "pl"
		case sa = "sa"
		case be = "be"
		case ro = "ro"
		case af = "af"
		case feature_name = "feature_name"
		case hi = "hi"
		case ar = "ar"
		case kw = "kw"
		case bo = "bo"
		case sl = "sl"
		case ne = "ne"
		case fr = "fr"
		case tg = "tg"
		case ru = "ru"
		case pt = "pt"
		case mr = "mr"
		case ja = "ja"
		case br = "br"
		case sr = "sr"
		case ur = "ur"
		case vi = "vi"
		case en = "en"
		case my = "my"
		case yo = "yo"
		case gd = "gd"
		case cu = "cu"
		case th = "th"
		case nl = "nl"
		case sv = "sv"
		case ku = "ku"
		case ascii = "ascii"
		case am = "am"
		case oc = "oc"
		case it = "it"
		case es = "es"
		case bg = "bg"
		case zh = "zh"
		case rm = "rm"
		case si = "si"
		case fa = "fa"
		case ml = "ml"
		case gu = "gu"
		case lv = "lv"
		case uk = "uk"
		case el = "el"
		case ps = "ps"
		case ba = "ba"
		case he = "he"
		case ln = "ln"
		case ab = "ab"
		case bn = "bn"
		case eu = "eu"
		case lt = "lt"
		case co = "co"
		case os = "os"
		case tt = "tt"
		case tl = "tl"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		ht = try values.decodeIfPresent(String.self, forKey: .ht)
		sc = try values.decodeIfPresent(String.self, forKey: .sc)
		de = try values.decodeIfPresent(String.self, forKey: .de)
		ta = try values.decodeIfPresent(String.self, forKey: .ta)
		mk = try values.decodeIfPresent(String.self, forKey: .mk)
		gv = try values.decodeIfPresent(String.self, forKey: .gv)
		mt = try values.decodeIfPresent(String.self, forKey: .mt)
		no = try values.decodeIfPresent(String.self, forKey: .no)
		yi = try values.decodeIfPresent(String.self, forKey: .yi)
		li = try values.decodeIfPresent(String.self, forKey: .li)
		ko = try values.decodeIfPresent(String.self, forKey: .ko)
		hu = try values.decodeIfPresent(String.self, forKey: .hu)
		fi = try values.decodeIfPresent(String.self, forKey: .fi)
		et = try values.decodeIfPresent(String.self, forKey: .et)
		ka = try values.decodeIfPresent(String.self, forKey: .ka)
		te = try values.decodeIfPresent(String.self, forKey: .te)
		cs = try values.decodeIfPresent(String.self, forKey: .cs)
		zu = try values.decodeIfPresent(String.self, forKey: .zu)
		kv = try values.decodeIfPresent(String.self, forKey: .kv)
		mn = try values.decodeIfPresent(String.self, forKey: .mn)
		ca = try values.decodeIfPresent(String.self, forKey: .ca)
		kn = try values.decodeIfPresent(String.self, forKey: .kn)
		lo = try values.decodeIfPresent(String.self, forKey: .lo)
		ky = try values.decodeIfPresent(String.self, forKey: .ky)
		kk = try values.decodeIfPresent(String.self, forKey: .kk)
		tr = try values.decodeIfPresent(String.self, forKey: .tr)
		sk = try values.decodeIfPresent(String.self, forKey: .sk)
		eo = try values.decodeIfPresent(String.self, forKey: .eo)
		mi = try values.decodeIfPresent(String.self, forKey: .mi)
		an = try values.decodeIfPresent(String.self, forKey: .an)
		gn = try values.decodeIfPresent(String.self, forKey: .gn)
		cy = try values.decodeIfPresent(String.self, forKey: .cy)
		gl = try values.decodeIfPresent(String.self, forKey: .gl)
		hy = try values.decodeIfPresent(String.self, forKey: .hy)
		or = try values.decodeIfPresent(String.self, forKey: .or)
		fy = try values.decodeIfPresent(String.self, forKey: .fy)
		wo = try values.decodeIfPresent(String.self, forKey: .wo)
		sq = try values.decodeIfPresent(String.self, forKey: .sq)
		ga = try values.decodeIfPresent(String.self, forKey: .ga)
		cv = try values.decodeIfPresent(String.self, forKey: .cv)
		pl = try values.decodeIfPresent(String.self, forKey: .pl)
		sa = try values.decodeIfPresent(String.self, forKey: .sa)
		be = try values.decodeIfPresent(String.self, forKey: .be)
		ro = try values.decodeIfPresent(String.self, forKey: .ro)
		af = try values.decodeIfPresent(String.self, forKey: .af)
		feature_name = try values.decodeIfPresent(String.self, forKey: .feature_name)
		hi = try values.decodeIfPresent(String.self, forKey: .hi)
		ar = try values.decodeIfPresent(String.self, forKey: .ar)
		kw = try values.decodeIfPresent(String.self, forKey: .kw)
		bo = try values.decodeIfPresent(String.self, forKey: .bo)
		sl = try values.decodeIfPresent(String.self, forKey: .sl)
		ne = try values.decodeIfPresent(String.self, forKey: .ne)
		fr = try values.decodeIfPresent(String.self, forKey: .fr)
		tg = try values.decodeIfPresent(String.self, forKey: .tg)
		ru = try values.decodeIfPresent(String.self, forKey: .ru)
		pt = try values.decodeIfPresent(String.self, forKey: .pt)
		mr = try values.decodeIfPresent(String.self, forKey: .mr)
		ja = try values.decodeIfPresent(String.self, forKey: .ja)
		br = try values.decodeIfPresent(String.self, forKey: .br)
		sr = try values.decodeIfPresent(String.self, forKey: .sr)
		ur = try values.decodeIfPresent(String.self, forKey: .ur)
		vi = try values.decodeIfPresent(String.self, forKey: .vi)
		en = try values.decodeIfPresent(String.self, forKey: .en)
		my = try values.decodeIfPresent(String.self, forKey: .my)
		yo = try values.decodeIfPresent(String.self, forKey: .yo)
		gd = try values.decodeIfPresent(String.self, forKey: .gd)
		cu = try values.decodeIfPresent(String.self, forKey: .cu)
		th = try values.decodeIfPresent(String.self, forKey: .th)
		nl = try values.decodeIfPresent(String.self, forKey: .nl)
		sv = try values.decodeIfPresent(String.self, forKey: .sv)
		ku = try values.decodeIfPresent(String.self, forKey: .ku)
		ascii = try values.decodeIfPresent(String.self, forKey: .ascii)
		am = try values.decodeIfPresent(String.self, forKey: .am)
		oc = try values.decodeIfPresent(String.self, forKey: .oc)
		it = try values.decodeIfPresent(String.self, forKey: .it)
		es = try values.decodeIfPresent(String.self, forKey: .es)
		bg = try values.decodeIfPresent(String.self, forKey: .bg)
		zh = try values.decodeIfPresent(String.self, forKey: .zh)
		rm = try values.decodeIfPresent(String.self, forKey: .rm)
		si = try values.decodeIfPresent(String.self, forKey: .si)
		fa = try values.decodeIfPresent(String.self, forKey: .fa)
		ml = try values.decodeIfPresent(String.self, forKey: .ml)
		gu = try values.decodeIfPresent(String.self, forKey: .gu)
		lv = try values.decodeIfPresent(String.self, forKey: .lv)
		uk = try values.decodeIfPresent(String.self, forKey: .uk)
		el = try values.decodeIfPresent(String.self, forKey: .el)
		ps = try values.decodeIfPresent(String.self, forKey: .ps)
		ba = try values.decodeIfPresent(String.self, forKey: .ba)
		he = try values.decodeIfPresent(String.self, forKey: .he)
		ln = try values.decodeIfPresent(String.self, forKey: .ln)
		ab = try values.decodeIfPresent(String.self, forKey: .ab)
		bn = try values.decodeIfPresent(String.self, forKey: .bn)
		eu = try values.decodeIfPresent(String.self, forKey: .eu)
		lt = try values.decodeIfPresent(String.self, forKey: .lt)
		co = try values.decodeIfPresent(String.self, forKey: .co)
		os = try values.decodeIfPresent(String.self, forKey: .os)
		tt = try values.decodeIfPresent(String.self, forKey: .tt)
		tl = try values.decodeIfPresent(String.self, forKey: .tl)
	}

}
