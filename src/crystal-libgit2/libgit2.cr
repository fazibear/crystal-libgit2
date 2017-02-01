@[Link("git2")]
lib LibGit2
  PATH_MAX = 4096
  OID_RAWSZ = 20
  OID_MINPREFIXLEN = 4
  REPOSITORY_INIT_OPTIONS_VERSION = 1
  DIFF_OPTIONS_VERSION = 1
  DIFF_FIND_OPTIONS_VERSION = 1
  CHECKOUT_OPTS_VERSION = 1
  IDXENTRY_STAGESHIFT = 12
  MERGE_TREE_OPTS_VERSION = 1
  TRANSPORT_VERSION = 1
  REMOTE_CALLBACKS_VERSION = 1
  CLONE_OPTIONS_VERSION = 1
  PUSH_OPTIONS_VERSION = 1
  ATTR_CHECK_FILE_THEN_INDEX = 0
  ATTR_CHECK_INDEX_THEN_FILE = 1
  ATTR_CHECK_INDEX_ONLY = 2
  STATUS_OPTIONS_VERSION = 1
  fun libgit2_version = git_libgit2_version(major : LibC::Int*, minor : LibC::Int*, rev : LibC::Int*)
  CapThreads = 1
  CapHttps = 2
  fun libgit2_fetaures = git_libgit2_fetures : LibC::Int
  OptGetMwindowSize = 0
  OptSetMwindowSize = 1
  OptGetMwindowMappedLimit = 2
  OptSetMwindowMappedLimit = 3
  OptGetSearchPath = 4
  OptSetSearchPath = 5
  OptSetCacheObjectLimit = 6
  OptSetCacheMaxSize = 7
  OptEnableCaching = 8
  OptGetCachedMemory = 9
  fun libgit2_opts = git_libgit2_opts(option : LibC::Int, ...) : LibC::Int
  fun libgit2_init = git_libgit2_init : LibC::Int
  fun libgit2_shutdown = git_libgit2_shutdown : LibC::Int
  Ok = 0
  Error = -1
  Enotfound = -3
  Eexists = -4
  Eambiguous = -5
  Ebufs = -6
  Euser = -7
  Ebarerepo = -8
  Eorphanedhead = -9
  Eunmerged = -10
  Enonfastforward = -11
  Einvalidspec = -12
  Emergeconflict = -13
  Passthrough = -30
  Iterover = -31
  ObjAny = -2
  ObjBad = -1
  ObjExt1 = 0
  ObjCommit = 1
  ObjTree = 2
  ObjBlob = 3
  ObjTag = 4
  ObjExt2 = 5
  ObjOfsDelta = 6
  ObjRefDelta = 7
  alias Odb = Void
  alias OdbBackend = Void
  alias OdbObject = Void
  struct OdbStream
    backend : X_OdbBackend
    mode : LibC::UInt
    read : (OdbStream*, LibC::Char*, LibC::SizeT -> LibC::Int)
    write : (OdbStream*, LibC::Char*, LibC::SizeT -> LibC::Int)
    finalize_write : (Oid*, OdbStream* -> LibC::Int)
    free : (OdbStream* -> Void)
  end
  type X_OdbBackend = Void*
  struct Oid
    id : UInt8[20]
  end
  struct OdbWritepack
    backend : X_OdbBackend
    add : (OdbWritepack*, Void*, LibC::SizeT, TransferProgress* -> LibC::Int)
    commit : (OdbWritepack*, TransferProgress* -> LibC::Int)
    free : (OdbWritepack* -> Void)
  end
  struct TransferProgress
    total_objects : LibC::UInt
    indexed_objects : LibC::UInt
    received_objects : LibC::UInt
    received_bytes : LibC::SizeT
  end
  alias Refdb = Void
  alias RefdbBackend = Void
  alias Repository = Void
  alias Object = Void
  alias Revwalk = Void
  alias Tag = Void
  alias Blob = Void
  alias Commit = Void
  alias TreeEntry = Void
  alias Tree = Void
  alias Treebuilder = Void
  alias Index = Void
  alias IndexConflictIterator = Void
  alias Config = Void
  alias ConfigBackend = Void
  alias ReflogEntry = Void
  alias Reflog = Void
  alias Note = Void
  alias Packbuilder = Void
  struct Time
    time : TimeT
    offset : LibC::Int
  end
  alias Int64T = LibC::Long
  alias TimeT = Int64T
  struct Signature
    name : LibC::Char*
    email : LibC::Char*
    when : Time
  end
  alias Reference = Void
  alias ReferenceIterator = Void
  alias MergeHead = Void
  alias StatusList = Void
  RefInvalid = 0
  RefOid = 1
  RefSymbolic = 2
  RefListall = 3
  BranchLocal = 1
  BranchRemote = 2
  FilemodeNew = 0
  FilemodeTree = 16384
  FilemodeBlob = 33188
  FilemodeBlobExecutable = 33261
  FilemodeLink = 40960
  FilemodeCommit = 57344
  alias Refspec = Void
  alias Remote = Void
  alias Push = Void
  struct RemoteHead
    local : LibC::Int
    oid : Oid
    loid : Oid
    name : LibC::Char*
  end
  struct RemoteCallbacks
    version : LibC::UInt
    progress : (LibC::Char*, LibC::Int, Void* -> Void)
    completion : (RemoteCompletionType, Void* -> LibC::Int)
    update_tips : (LibC::Char*, Oid*, Oid*, Void* -> LibC::Int)
    payload : Void*
  end
  enum RemoteCompletionType
    RemoteCompletionDownload = 0
    RemoteCompletionIndexing = 1
    RemoteCompletionError = 2
  end
  fun oid_fromstr = git_oid_fromstr(out : Oid*, str : LibC::Char*) : LibC::Int
  fun oid_fromstrp = git_oid_fromstrp(out : Oid*, str : LibC::Char*) : LibC::Int
  fun oid_fromstrn = git_oid_fromstrn(out : Oid*, str : LibC::Char*, length : LibC::SizeT) : LibC::Int
  fun oid_fromraw = git_oid_fromraw(out : Oid*, raw : UInt8*)
  fun oid_fmt = git_oid_fmt(out : LibC::Char*, id : Oid*)
  fun oid_nfmt = git_oid_nfmt(out : LibC::Char*, n : LibC::SizeT, id : Oid*)
  fun oid_pathfmt = git_oid_pathfmt(out : LibC::Char*, id : Oid*)
  fun oid_allocfmt = git_oid_allocfmt(id : Oid*) : LibC::Char*
  fun oid_tostr = git_oid_tostr(out : LibC::Char*, n : LibC::SizeT, id : Oid*) : LibC::Char*
  fun oid_cpy = git_oid_cpy(out : Oid*, src : Oid*)
  fun oid_cmp = git_oid_cmp(a : Oid*, b : Oid*) : LibC::Int
  fun oid_equal = git_oid_equal(a : Oid*, b : Oid*) : LibC::Int
  fun oid_ncmp = git_oid_ncmp(a : Oid*, b : Oid*, len : LibC::SizeT) : LibC::Int
  fun oid_streq = git_oid_streq(id : Oid*, str : LibC::Char*) : LibC::Int
  fun oid_strcmp = git_oid_strcmp(id : Oid*, str : LibC::Char*) : LibC::Int
  fun oid_iszero = git_oid_iszero(id : Oid*) : LibC::Int
  alias OidShorten = Void
  fun oid_shorten_new = git_oid_shorten_new(min_length : LibC::SizeT) : X_OidShorten
  type X_OidShorten = Void*
  fun oid_shorten_add = git_oid_shorten_add(os : X_OidShorten, text_id : LibC::Char*) : LibC::Int
  fun oid_shorten_free = git_oid_shorten_free(os : X_OidShorten)
  fun signature_new = git_signature_new(out : Signature**, name : LibC::Char*, email : LibC::Char*, time : TimeT, offset : LibC::Int) : LibC::Int
  fun signature_now = git_signature_now(out : Signature**, name : LibC::Char*, email : LibC::Char*) : LibC::Int
  fun signature_dup = git_signature_dup(sig : Signature*) : Signature*
  fun signature_free = git_signature_free(sig : Signature*)
  fun odb_new = git_odb_new(out : X_Odb*) : LibC::Int
  type X_Odb = Void*
  fun odb_open = git_odb_open(out : X_Odb*, objects_dir : LibC::Char*) : LibC::Int
  fun odb_add_disk_alternate = git_odb_add_disk_alternate(odb : X_Odb, path : LibC::Char*) : LibC::Int
  fun odb_free = git_odb_free(db : X_Odb)
  fun odb_read = git_odb_read(out : X_OdbObject*, db : X_Odb, id : Oid*) : LibC::Int
  type X_OdbObject = Void*
  fun odb_read_prefix = git_odb_read_prefix(out : X_OdbObject*, db : X_Odb, short_id : Oid*, len : LibC::SizeT) : LibC::Int
  fun odb_read_header = git_odb_read_header(len_out : LibC::SizeT*, type_out : Otype*, db : X_Odb, id : Oid*) : LibC::Int
  enum Otype
    ObjAny = -2
    ObjBad = -1
    ObjExt1 = 0
    ObjCommit = 1
    ObjTree = 2
    ObjBlob = 3
    ObjTag = 4
    ObjExt2 = 5
    ObjOfsDelta = 6
    ObjRefDelta = 7
  end
  fun odb_exists = git_odb_exists(db : X_Odb, id : Oid*) : LibC::Int
  fun odb_refresh = git_odb_refresh(db : Odb*) : LibC::Int
  fun odb_foreach = git_odb_foreach(db : X_Odb, cb : OdbForeachCb, payload : Void*) : LibC::Int
  alias OdbForeachCb = (Oid*, Void* -> LibC::Int)
  fun odb_write = git_odb_write(out : Oid*, odb : X_Odb, data : Void*, len : LibC::SizeT, type : Otype) : LibC::Int
  fun odb_open_wstream = git_odb_open_wstream(out : OdbStream**, db : X_Odb, size : LibC::SizeT, type : Otype) : LibC::Int
  fun odb_open_rstream = git_odb_open_rstream(out : OdbStream**, db : X_Odb, oid : Oid*) : LibC::Int
  fun odb_write_pack = git_odb_write_pack(out : OdbWritepack**, db : X_Odb, progress_cb : TransferProgressCallback, progress_payload : Void*) : LibC::Int
  alias TransferProgressCallback = (TransferProgress*, Void* -> LibC::Int)
  fun odb_hash = git_odb_hash(out : Oid*, data : Void*, len : LibC::SizeT, type : Otype) : LibC::Int
  fun odb_hashfile = git_odb_hashfile(out : Oid*, path : LibC::Char*, type : Otype) : LibC::Int
  fun odb_object_free = git_odb_object_free(object : X_OdbObject)
  fun odb_object_id = git_odb_object_id(object : X_OdbObject) : Oid*
  fun odb_object_data = git_odb_object_data(object : X_OdbObject) : Void*
  fun odb_object_size = git_odb_object_size(object : X_OdbObject) : LibC::SizeT
  fun odb_object_type = git_odb_object_type(object : X_OdbObject) : Otype
  fun odb_add_backend = git_odb_add_backend(odb : X_Odb, backend : X_OdbBackend, priority : LibC::Int) : LibC::Int
  fun odb_add_alternate = git_odb_add_alternate(odb : X_Odb, backend : X_OdbBackend, priority : LibC::Int) : LibC::Int
  fun odb_num_backends = git_odb_num_backends(odb : X_Odb) : LibC::SizeT
  fun odb_get_backend = git_odb_get_backend(out : X_OdbBackend*, odb : X_Odb, pos : LibC::SizeT) : LibC::Int
  fun repository_open = git_repository_open(out : X_Repository*, path : LibC::Char*) : LibC::Int
  type X_Repository = Void*
  fun repository_wrap_odb = git_repository_wrap_odb(out : X_Repository*, odb : X_Odb) : LibC::Int
  fun repository_discover = git_repository_discover(path_out : LibC::Char*, path_size : LibC::SizeT, start_path : LibC::Char*, across_fs : LibC::Int, ceiling_dirs : LibC::Char*) : LibC::Int
  RepositoryOpenNoSearch = 1
  RepositoryOpenCrossFs = 2
  fun repository_open_ext = git_repository_open_ext(out : X_Repository*, path : LibC::Char*, flags : LibC::UInt, ceiling_dirs : LibC::Char*) : LibC::Int
  fun repository_open_bare = git_repository_open_bare(out : X_Repository*, bare_path : LibC::Char*) : LibC::Int
  fun repository_free = git_repository_free(repo : X_Repository)
  fun repository_init = git_repository_init(out : X_Repository*, path : LibC::Char*, is_bare : LibC::UInt) : LibC::Int
  RepositoryInitBare = 1
  RepositoryInitNoReinit = 2
  RepositoryInitNoDotgitDir = 4
  RepositoryInitMkdir = 8
  RepositoryInitMkpath = 16
  RepositoryInitExternalTemplate = 32
  RepositoryInitSharedUmask = 0
  RepositoryInitSharedGroup = 1533
  RepositoryInitSharedAll = 1535
  fun repository_init_ext = git_repository_init_ext(out : X_Repository*, repo_path : LibC::Char*, opts : RepositoryInitOptions*) : LibC::Int
  struct RepositoryInitOptions
    version : LibC::UInt
    flags : Uint32T
    mode : Uint32T
    workdir_path : LibC::Char*
    description : LibC::Char*
    template_path : LibC::Char*
    initial_head : LibC::Char*
    origin_url : LibC::Char*
  end
  alias Uint32T = LibC::UInt
  fun repository_head = git_repository_head(out : X_Reference*, repo : X_Repository) : LibC::Int
  type X_Reference = Void*
  fun repository_head_detached = git_repository_head_detached(repo : X_Repository) : LibC::Int
  fun repository_head_orphan = git_repository_head_orphan(repo : X_Repository) : LibC::Int
  fun repository_is_empty = git_repository_is_empty(repo : X_Repository) : LibC::Int
  fun repository_path = git_repository_path(repo : X_Repository) : LibC::Char*
  fun repository_workdir = git_repository_workdir(repo : X_Repository) : LibC::Char*
  fun repository_set_workdir = git_repository_set_workdir(repo : X_Repository, workdir : LibC::Char*, update_gitlink : LibC::Int) : LibC::Int
  fun repository_is_bare = git_repository_is_bare(repo : X_Repository) : LibC::Int
  fun repository_config = git_repository_config(out : X_Config*, repo : X_Repository) : LibC::Int
  type X_Config = Void*
  fun repository_odb = git_repository_odb(out : X_Odb*, repo : X_Repository) : LibC::Int
  fun repository_refdb = git_repository_refdb(out : X_Refdb*, repo : X_Repository) : LibC::Int
  type X_Refdb = Void*
  fun repository_index = git_repository_index(out : X_Index*, repo : X_Repository) : LibC::Int
  type X_Index = Void*
  fun repository_message = git_repository_message(out : LibC::Char*, len : LibC::SizeT, repo : X_Repository) : LibC::Int
  fun repository_message_remove = git_repository_message_remove(repo : X_Repository) : LibC::Int
  fun repository_merge_cleanup = git_repository_merge_cleanup(repo : X_Repository) : LibC::Int
  fun repository_fetchhead_foreach = git_repository_fetchhead_foreach(repo : X_Repository, callback : RepositoryFetchheadForeachCb, payload : Void*) : LibC::Int
  alias RepositoryFetchheadForeachCb = (LibC::Char*, LibC::Char*, Oid*, LibC::UInt, Void* -> LibC::Int)
  fun repository_mergehead_foreach = git_repository_mergehead_foreach(repo : X_Repository, callback : RepositoryMergeheadForeachCb, payload : Void*) : LibC::Int
  alias RepositoryMergeheadForeachCb = (Oid*, Void* -> LibC::Int)
  fun repository_hashfile = git_repository_hashfile(out : Oid*, repo : X_Repository, path : LibC::Char*, type : Otype, as_path : LibC::Char*) : LibC::Int
  fun repository_set_head = git_repository_set_head(repo : X_Repository, refname : LibC::Char*) : LibC::Int
  fun repository_set_head_detached = git_repository_set_head_detached(repo : X_Repository, commitish : Oid*) : LibC::Int
  fun repository_detach_head = git_repository_detach_head(repo : X_Repository) : LibC::Int
  RepositoryStateNone = 0
  RepositoryStateMerge = 1
  RepositoryStateRevert = 2
  RepositoryStateCherryPick = 3
  RepositoryStateBisect = 4
  RepositoryStateRebase = 5
  RepositoryStateRebaseInteractive = 6
  RepositoryStateRebaseMerge = 7
  RepositoryStateApplyMailbox = 8
  RepositoryStateApplyMailboxOrRebase = 9
  fun repository_state = git_repository_state(repo : X_Repository) : LibC::Int
  fun repository_set_namespace = git_repository_set_namespace(repo : X_Repository, nmspace : LibC::Char*) : LibC::Int
  fun repository_get_namespace = git_repository_get_namespace(repo : X_Repository) : LibC::Char*
  fun repository_is_shallow = git_repository_is_shallow(repo : X_Repository) : LibC::Int
  fun revwalk_new = git_revwalk_new(out : X_Revwalk*, repo : X_Repository) : LibC::Int
  type X_Revwalk = Void*
  fun revwalk_reset = git_revwalk_reset(walker : X_Revwalk)
  fun revwalk_push = git_revwalk_push(walk : X_Revwalk, id : Oid*) : LibC::Int
  fun revwalk_push_glob = git_revwalk_push_glob(walk : X_Revwalk, glob : LibC::Char*) : LibC::Int
  fun revwalk_push_head = git_revwalk_push_head(walk : X_Revwalk) : LibC::Int
  fun revwalk_hide = git_revwalk_hide(walk : X_Revwalk, commit_id : Oid*) : LibC::Int
  fun revwalk_hide_glob = git_revwalk_hide_glob(walk : X_Revwalk, glob : LibC::Char*) : LibC::Int
  fun revwalk_hide_head = git_revwalk_hide_head(walk : X_Revwalk) : LibC::Int
  fun revwalk_push_ref = git_revwalk_push_ref(walk : X_Revwalk, refname : LibC::Char*) : LibC::Int
  fun revwalk_hide_ref = git_revwalk_hide_ref(walk : X_Revwalk, refname : LibC::Char*) : LibC::Int
  fun revwalk_next = git_revwalk_next(out : Oid*, walk : X_Revwalk) : LibC::Int
  fun revwalk_sorting = git_revwalk_sorting(walk : X_Revwalk, sort_mode : LibC::UInt)
  fun revwalk_push_range = git_revwalk_push_range(walk : X_Revwalk, range : LibC::Char*) : LibC::Int
  fun revwalk_free = git_revwalk_free(walk : X_Revwalk)
  fun revwalk_repository = git_revwalk_repository(walk : X_Revwalk) : X_Repository
  fun object_lookup = git_object_lookup(object : X_Object*, repo : X_Repository, id : Oid*, type : Otype) : LibC::Int
  type X_Object = Void*
  fun object_lookup_prefix = git_object_lookup_prefix(object_out : X_Object*, repo : X_Repository, id : Oid*, len : LibC::SizeT, type : Otype) : LibC::Int
  fun object_id = git_object_id(obj : X_Object) : Oid*
  fun object_type = git_object_type(obj : X_Object) : Otype
  fun object_owner = git_object_owner(obj : X_Object) : X_Repository
  fun object_free = git_object_free(object : X_Object)
  fun object_type2string = git_object_type2string(type : Otype) : LibC::Char*
  fun object_string2type = git_object_string2type(str : LibC::Char*) : Otype
  fun object_typeisloose = git_object_typeisloose(type : Otype) : LibC::Int
  fun object__size = git_object__size(type : Otype) : LibC::SizeT
  fun object_peel = git_object_peel(peeled : X_Object*, object : X_Object, target_type : Otype) : LibC::Int
  fun object_dup = git_object_dup(dest : X_Object*, source : X_Object) : LibC::Int
  fun tree_lookup = git_tree_lookup(out : X_Tree*, repo : X_Repository, id : Oid*) : LibC::Int
  type X_Tree = Void*
  fun tree_lookup_prefix = git_tree_lookup_prefix(out : X_Tree*, repo : X_Repository, id : Oid*, len : LibC::SizeT) : LibC::Int
  fun tree_free = git_tree_free(tree : X_Tree)
  fun tree_id = git_tree_id(tree : X_Tree) : Oid*
  fun tree_owner = git_tree_owner(tree : X_Tree) : X_Repository
  fun tree_entrycount = git_tree_entrycount(tree : X_Tree) : LibC::SizeT
  fun tree_entry_byname = git_tree_entry_byname(tree : X_Tree, filename : LibC::Char*) : X_TreeEntry
  type X_TreeEntry = Void*
  fun tree_entry_byindex = git_tree_entry_byindex(tree : X_Tree, idx : LibC::SizeT) : X_TreeEntry
  fun tree_entry_byoid = git_tree_entry_byoid(tree : X_Tree, oid : Oid*) : X_TreeEntry
  fun tree_entry_bypath = git_tree_entry_bypath(out : X_TreeEntry*, root : X_Tree, path : LibC::Char*) : LibC::Int
  fun tree_entry_dup = git_tree_entry_dup(entry : X_TreeEntry) : X_TreeEntry
  fun tree_entry_free = git_tree_entry_free(entry : X_TreeEntry)
  fun tree_entry_name = git_tree_entry_name(entry : X_TreeEntry) : LibC::Char*
  fun tree_entry_id = git_tree_entry_id(entry : X_TreeEntry) : Oid*
  fun tree_entry_type = git_tree_entry_type(entry : X_TreeEntry) : Otype
  fun tree_entry_filemode = git_tree_entry_filemode(entry : X_TreeEntry) : FilemodeT
  enum FilemodeT
    FilemodeNew = 0
    FilemodeTree = 16384
    FilemodeBlob = 33188
    FilemodeBlobExecutable = 33261
    FilemodeLink = 40960
    FilemodeCommit = 57344
  end
  fun tree_entry_cmp = git_tree_entry_cmp(e1 : X_TreeEntry, e2 : X_TreeEntry) : LibC::Int
  fun tree_entry_to_object = git_tree_entry_to_object(object_out : X_Object*, repo : X_Repository, entry : X_TreeEntry) : LibC::Int
  fun treebuilder_create = git_treebuilder_create(out : X_Treebuilder*, source : X_Tree) : LibC::Int
  type X_Treebuilder = Void*
  fun treebuilder_clear = git_treebuilder_clear(bld : X_Treebuilder)
  fun treebuilder_entrycount = git_treebuilder_entrycount(bld : X_Treebuilder) : LibC::UInt
  fun treebuilder_free = git_treebuilder_free(bld : X_Treebuilder)
  fun treebuilder_get = git_treebuilder_get(bld : X_Treebuilder, filename : LibC::Char*) : X_TreeEntry
  fun treebuilder_insert = git_treebuilder_insert(out : X_TreeEntry*, bld : X_Treebuilder, filename : LibC::Char*, id : Oid*, filemode : FilemodeT) : LibC::Int
  fun treebuilder_remove = git_treebuilder_remove(bld : X_Treebuilder, filename : LibC::Char*) : LibC::Int
  fun treebuilder_filter = git_treebuilder_filter(bld : X_Treebuilder, filter : TreebuilderFilterCb, payload : Void*)
  alias TreebuilderFilterCb = (X_TreeEntry, Void* -> LibC::Int)
  fun treebuilder_write = git_treebuilder_write(id : Oid*, repo : X_Repository, bld : X_Treebuilder) : LibC::Int
  TreewalkPre = 0
  TreewalkPost = 1
  fun tree_walk = git_tree_walk(tree : X_Tree, mode : TreewalkMode, callback : TreewalkCb, payload : Void*) : LibC::Int
  enum TreewalkMode
    TreewalkPre = 0
    TreewalkPost = 1
  end
  alias TreewalkCb = (LibC::Char*, X_TreeEntry, Void* -> LibC::Int)
  struct Strarray
    strings : LibC::Char**
    count : LibC::SizeT
  end
  fun strarray_free = git_strarray_free(array : Strarray*)
  fun strarray_copy = git_strarray_copy(tgt : Strarray*, src : Strarray*) : LibC::Int
  fun reference_lookup = git_reference_lookup(out : X_Reference*, repo : X_Repository, name : LibC::Char*) : LibC::Int
  fun reference_name_to_id = git_reference_name_to_id(out : Oid*, repo : X_Repository, name : LibC::Char*) : LibC::Int
  fun reference_dwim = git_reference_dwim(out : X_Reference*, repo : X_Repository, shorthand : LibC::Char*) : LibC::Int
  fun reference_symbolic_create = git_reference_symbolic_create(out : X_Reference*, repo : X_Repository, name : LibC::Char*, target : LibC::Char*, force : LibC::Int) : LibC::Int
  fun reference_create = git_reference_create(out : X_Reference*, repo : X_Repository, name : LibC::Char*, id : Oid*, force : LibC::Int) : LibC::Int
  fun reference_target = git_reference_target(ref : X_Reference) : Oid*
  fun reference_target_peel = git_reference_target_peel(ref : X_Reference) : Oid*
  fun reference_symbolic_target = git_reference_symbolic_target(ref : X_Reference) : LibC::Char*
  fun reference_type = git_reference_type(ref : X_Reference) : RefT
  enum RefT
    RefInvalid = 0
    RefOid = 1
    RefSymbolic = 2
    RefListall = 3
  end
  fun reference_name = git_reference_name(ref : X_Reference) : LibC::Char*
  fun reference_resolve = git_reference_resolve(out : X_Reference*, ref : X_Reference) : LibC::Int
  fun reference_owner = git_reference_owner(ref : X_Reference) : X_Repository
  fun reference_symbolic_set_target = git_reference_symbolic_set_target(out : X_Reference*, ref : X_Reference, target : LibC::Char*) : LibC::Int
  fun reference_set_target = git_reference_set_target(out : X_Reference*, ref : X_Reference, id : Oid*) : LibC::Int
  fun reference_rename = git_reference_rename(new_ref : X_Reference*, ref : X_Reference, new_name : LibC::Char*, force : LibC::Int) : LibC::Int
  fun reference_delete = git_reference_delete(ref : X_Reference) : LibC::Int
  fun reference_list = git_reference_list(array : Strarray*, repo : X_Repository) : LibC::Int
  fun reference_foreach = git_reference_foreach(repo : X_Repository, callback : ReferenceForeachCb, payload : Void*) : LibC::Int
  alias ReferenceForeachCb = (X_Reference, Void* -> LibC::Int)
  fun reference_foreach_name = git_reference_foreach_name(repo : X_Repository, callback : ReferenceForeachNameCb, payload : Void*) : LibC::Int
  alias ReferenceForeachNameCb = (LibC::Char*, Void* -> LibC::Int)
  fun reference_free = git_reference_free(ref : X_Reference)
  fun reference_cmp = git_reference_cmp(ref1 : X_Reference, ref2 : X_Reference) : LibC::Int
  fun reference_iterator_new = git_reference_iterator_new(out : X_ReferenceIterator*, repo : X_Repository) : LibC::Int
  type X_ReferenceIterator = Void*
  fun reference_iterator_glob_new = git_reference_iterator_glob_new(out : X_ReferenceIterator*, repo : X_Repository, glob : LibC::Char*) : LibC::Int
  fun reference_next = git_reference_next(out : X_Reference*, iter : X_ReferenceIterator) : LibC::Int
  fun reference_next_name = git_reference_next_name(out : LibC::Char**, iter : X_ReferenceIterator) : LibC::Int
  fun reference_iterator_free = git_reference_iterator_free(iter : X_ReferenceIterator)
  fun reference_foreach_glob = git_reference_foreach_glob(repo : X_Repository, glob : LibC::Char*, callback : ReferenceForeachNameCb, payload : Void*) : LibC::Int
  fun reference_has_log = git_reference_has_log(ref : X_Reference) : LibC::Int
  fun reference_is_branch = git_reference_is_branch(ref : X_Reference) : LibC::Int
  fun reference_is_remote = git_reference_is_remote(ref : X_Reference) : LibC::Int
  RefFormatNormal = 0
  RefFormatAllowOnelevel = 1
  RefFormatRefspecPattern = 2
  RefFormatRefspecShorthand = 4
  fun reference_normalize_name = git_reference_normalize_name(buffer_out : LibC::Char*, buffer_size : LibC::SizeT, name : LibC::Char*, flags : LibC::UInt) : LibC::Int
  fun reference_peel = git_reference_peel(out : X_Object*, ref : X_Reference, type : Otype) : LibC::Int
  fun reference_is_valid_name = git_reference_is_valid_name(refname : LibC::Char*) : LibC::Int
  fun reference_shorthand = git_reference_shorthand(ref : X_Reference) : LibC::Char*
  DiffNormal = 0
  DiffReverse = 1
  DiffForceText = 2
  DiffIgnoreWhitespace = 4
  DiffIgnoreWhitespaceChange = 8
  DiffIgnoreWhitespaceEol = 16
  DiffIgnoreSubmodules = 32
  DiffPatience = 64
  DiffIncludeIgnored = 128
  DiffIncludeUntracked = 256
  DiffIncludeUnmodified = 512
  DiffRecurseUntrackedDirs = 1024
  DiffDisablePathspecMatch = 2048
  DiffDeltasAreIcase = 4096
  DiffIncludeUntrackedContent = 8192
  DiffSkipBinaryCheck = 16384
  DiffIncludeTypechange = 32768
  DiffIncludeTypechangeTrees = 65536
  DiffIgnoreFilemode = 131072
  DiffRecurseIgnoredDirs = 262144
  DiffFastUntrackedDirs = 524288
  DiffForceBinary = 1048576
  alias DiffList = Void
  DiffFlagBinary = 1
  DiffFlagNotBinary = 2
  DiffFlagValidOid = 4
  DeltaUnmodified = 0
  DeltaAdded = 1
  DeltaDeleted = 2
  DeltaModified = 3
  DeltaRenamed = 4
  DeltaCopied = 5
  DeltaIgnored = 6
  DeltaUntracked = 7
  DeltaTypechange = 8
  DiffLineContext = 32
  DiffLineAddition = 43
  DiffLineDeletion = 45
  DiffLineContextEofnl = 61
  DiffLineAddEofnl = 62
  DiffLineDelEofnl = 60
  DiffLineFileHdr = 70
  DiffLineHunkHdr = 72
  DiffLineBinary = 66
  alias DiffPatch = Void
  DiffFindRenames = 1
  DiffFindRenamesFromRewrites = 2
  DiffFindCopies = 4
  DiffFindCopiesFromUnmodified = 8
  DiffFindRewrites = 16
  DiffBreakRewrites = 32
  DiffFindAndBreakRewrites = 48
  DiffFindForUntracked = 64
  DiffFindAll = 255
  DiffFindIgnoreLeadingWhitespace = 0
  DiffFindIgnoreWhitespace = 4096
  DiffFindDontIgnoreWhitespace = 8192
  DiffFindExactMatchOnly = 16384
  fun diff_list_free = git_diff_list_free(diff : X_DiffList)
  type X_DiffList = Void*
  fun diff_tree_to_tree = git_diff_tree_to_tree(diff : X_DiffList*, repo : X_Repository, old_tree : X_Tree, new_tree : X_Tree, opts : DiffOptions*) : LibC::Int
  struct DiffOptions
    version : LibC::UInt
    flags : Uint32T
    context_lines : Uint16T
    interhunk_lines : Uint16T
    old_prefix : LibC::Char*
    new_prefix : LibC::Char*
    pathspec : Strarray
    max_size : OffT
    notify_cb : DiffNotifyCb
    notify_payload : Void*
  end
  alias Uint16T = LibC::UShort
  alias OffT = Int64T
  struct DiffDelta
    old_file : DiffFile
    new_file : DiffFile
    status : DeltaT
    similarity : Uint32T
    flags : Uint32T
  end
  alias DiffNotifyCb = (X_DiffList, DiffDelta*, LibC::Char*, Void* -> LibC::Int)
  struct DiffFile
    oid : Oid
    path : LibC::Char*
    size : OffT
    flags : Uint32T
    mode : Uint16T
  end
  enum DeltaT
    DeltaUnmodified = 0
    DeltaAdded = 1
    DeltaDeleted = 2
    DeltaModified = 3
    DeltaRenamed = 4
    DeltaCopied = 5
    DeltaIgnored = 6
    DeltaUntracked = 7
    DeltaTypechange = 8
  end
  fun diff_tree_to_index = git_diff_tree_to_index(diff : X_DiffList*, repo : X_Repository, old_tree : X_Tree, index : X_Index, opts : DiffOptions*) : LibC::Int
  fun diff_index_to_workdir = git_diff_index_to_workdir(diff : X_DiffList*, repo : X_Repository, index : X_Index, opts : DiffOptions*) : LibC::Int
  fun diff_tree_to_workdir = git_diff_tree_to_workdir(diff : X_DiffList*, repo : X_Repository, old_tree : X_Tree, opts : DiffOptions*) : LibC::Int
  fun diff_merge = git_diff_merge(onto : X_DiffList, from : X_DiffList) : LibC::Int
  fun diff_find_similar = git_diff_find_similar(diff : X_DiffList, options : DiffFindOptions*) : LibC::Int
  struct DiffFindOptions
    version : LibC::UInt
    flags : Uint32T
    rename_threshold : Uint16T
    rename_from_rewrite_threshold : Uint16T
    copy_threshold : Uint16T
    break_rewrite_threshold : Uint16T
    rename_limit : LibC::SizeT
    metric : DiffSimilarityMetric*
  end
  struct DiffSimilarityMetric
    file_signature : (Void**, DiffFile*, LibC::Char*, Void* -> LibC::Int)
    buffer_signature : (Void**, DiffFile*, LibC::Char*, LibC::SizeT, Void* -> LibC::Int)
    free_signature : (Void*, Void* -> Void)
    similarity : (LibC::Int*, Void*, Void*, Void* -> LibC::Int)
    payload : Void*
  end
  fun diff_foreach = git_diff_foreach(diff : X_DiffList, file_cb : DiffFileCb, hunk_cb : DiffHunkCb, line_cb : DiffDataCb, payload : Void*) : LibC::Int
  alias DiffFileCb = (DiffDelta*, LibC::Float, Void* -> LibC::Int)
  struct DiffRange
    old_start : LibC::Int
    old_lines : LibC::Int
    new_start : LibC::Int
    new_lines : LibC::Int
  end
  alias DiffHunkCb = (DiffDelta*, DiffRange*, LibC::Char*, LibC::SizeT, Void* -> LibC::Int)
  alias DiffDataCb = (DiffDelta*, DiffRange*, LibC::Char, LibC::Char*, LibC::SizeT, Void* -> LibC::Int)
  fun diff_print_compact = git_diff_print_compact(diff : X_DiffList, print_cb : DiffDataCb, payload : Void*) : LibC::Int
  fun diff_print_raw = git_diff_print_raw(diff : X_DiffList, print_cb : DiffDataCb, payload : Void*) : LibC::Int
  fun diff_status_char = git_diff_status_char(status : DeltaT) : LibC::Char
  fun diff_print_patch = git_diff_print_patch(diff : X_DiffList, print_cb : DiffDataCb, payload : Void*) : LibC::Int
  fun diff_num_deltas = git_diff_num_deltas(diff : X_DiffList) : LibC::SizeT
  fun diff_num_deltas_of_type = git_diff_num_deltas_of_type(diff : X_DiffList, type : DeltaT) : LibC::SizeT
  fun diff_get_patch = git_diff_get_patch(patch_out : X_DiffPatch*, delta_out : DiffDelta**, diff : X_DiffList, idx : LibC::SizeT) : LibC::Int
  type X_DiffPatch = Void*
  fun diff_patch_free = git_diff_patch_free(patch : X_DiffPatch)
  fun diff_patch_delta = git_diff_patch_delta(patch : X_DiffPatch) : DiffDelta*
  fun diff_patch_num_hunks = git_diff_patch_num_hunks(patch : X_DiffPatch) : LibC::SizeT
  fun diff_patch_line_stats = git_diff_patch_line_stats(total_context : LibC::SizeT*, total_additions : LibC::SizeT*, total_deletions : LibC::SizeT*, patch : X_DiffPatch) : LibC::Int
  fun diff_patch_get_hunk = git_diff_patch_get_hunk(range : DiffRange**, header : LibC::Char**, header_len : LibC::SizeT*, lines_in_hunk : LibC::SizeT*, patch : X_DiffPatch, hunk_idx : LibC::SizeT) : LibC::Int
  fun diff_patch_num_lines_in_hunk = git_diff_patch_num_lines_in_hunk(patch : X_DiffPatch, hunk_idx : LibC::SizeT) : LibC::Int
  fun diff_patch_get_line_in_hunk = git_diff_patch_get_line_in_hunk(line_origin : LibC::Char*, content : LibC::Char**, content_len : LibC::SizeT*, old_lineno : LibC::Int*, new_lineno : LibC::Int*, patch : X_DiffPatch, hunk_idx : LibC::SizeT, line_of_hunk : LibC::SizeT) : LibC::Int
  fun diff_patch_print = git_diff_patch_print(patch : X_DiffPatch, print_cb : DiffDataCb, payload : Void*) : LibC::Int
  fun diff_patch_to_str = git_diff_patch_to_str(string : LibC::Char**, patch : X_DiffPatch) : LibC::Int
  fun diff_blobs = git_diff_blobs(old_blob : X_Blob, old_as_path : LibC::Char*, new_blob : X_Blob, new_as_path : LibC::Char*, options : DiffOptions*, file_cb : DiffFileCb, hunk_cb : DiffHunkCb, line_cb : DiffDataCb, payload : Void*) : LibC::Int
  type X_Blob = Void*
  fun diff_patch_from_blobs = git_diff_patch_from_blobs(out : X_DiffPatch*, old_blob : X_Blob, old_as_path : LibC::Char*, new_blob : X_Blob, new_as_path : LibC::Char*, opts : DiffOptions*) : LibC::Int
  fun diff_blob_to_buffer = git_diff_blob_to_buffer(old_blob : X_Blob, old_as_path : LibC::Char*, buffer : LibC::Char*, buffer_len : LibC::SizeT, buffer_as_path : LibC::Char*, options : DiffOptions*, file_cb : DiffFileCb, hunk_cb : DiffHunkCb, data_cb : DiffDataCb, payload : Void*) : LibC::Int
  fun diff_patch_from_blob_and_buffer = git_diff_patch_from_blob_and_buffer(out : X_DiffPatch*, old_blob : X_Blob, old_as_path : LibC::Char*, buffer : LibC::Char*, buffer_len : LibC::SizeT, buffer_as_path : LibC::Char*, opts : DiffOptions*) : LibC::Int
  CheckoutNone = 0
  CheckoutSafe = 1
  CheckoutSafeCreate = 2
  CheckoutForce = 4
  CheckoutAllowConflicts = 16
  CheckoutRemoveUntracked = 32
  CheckoutRemoveIgnored = 64
  CheckoutUpdateOnly = 128
  CheckoutDontUpdateIndex = 256
  CheckoutNoRefresh = 512
  CheckoutDisablePathspecMatch = 8192
  CheckoutSkipLockedDirectories = 262144
  CheckoutSkipUnmerged = 1024
  CheckoutUseOurs = 2048
  CheckoutUseTheirs = 4096
  CheckoutUpdateSubmodules = 65536
  CheckoutUpdateSubmodulesIfChanged = 131072
  CheckoutNotifyNone = 0
  CheckoutNotifyConflict = 1
  CheckoutNotifyDirty = 2
  CheckoutNotifyUpdated = 4
  CheckoutNotifyUntracked = 8
  CheckoutNotifyIgnored = 16
  CheckoutNotifyAll = 65535
  struct CheckoutOpts
    version : LibC::UInt
    checkout_strategy : LibC::UInt
    disable_filters : LibC::Int
    dir_mode : LibC::UInt
    file_mode : LibC::UInt
    file_open_flags : LibC::Int
    notify_flags : LibC::UInt
    notify_cb : CheckoutNotifyCb
    notify_payload : Void*
    progress_cb : CheckoutProgressCb
    progress_payload : Void*
    paths : Strarray
    baseline : X_Tree
    target_directory : LibC::Char*
  end
  enum CheckoutNotifyT
    CheckoutNotifyNone = 0
    CheckoutNotifyConflict = 1
    CheckoutNotifyDirty = 2
    CheckoutNotifyUpdated = 4
    CheckoutNotifyUntracked = 8
    CheckoutNotifyIgnored = 16
    CheckoutNotifyAll = 65535
  end
  alias CheckoutNotifyCb = (CheckoutNotifyT, LibC::Char*, DiffFile*, DiffFile*, DiffFile*, Void* -> LibC::Int)
  alias CheckoutProgressCb = (LibC::Char*, LibC::SizeT, LibC::SizeT, Void* -> Void)
  fun checkout_head = git_checkout_head(repo : X_Repository, opts : CheckoutOpts*) : LibC::Int
  fun checkout_index = git_checkout_index(repo : X_Repository, index : X_Index, opts : CheckoutOpts*) : LibC::Int
  fun checkout_tree = git_checkout_tree(repo : X_Repository, treeish : X_Object, opts : CheckoutOpts*) : LibC::Int
  alias IndexerStream = Void
  fun indexer_stream_new = git_indexer_stream_new(out : X_IndexerStream*, path : LibC::Char*, progress_cb : TransferProgressCallback, progress_cb_payload : Void*) : LibC::Int
  type X_IndexerStream = Void*
  fun indexer_stream_add = git_indexer_stream_add(idx : X_IndexerStream, data : Void*, size : LibC::SizeT, stats : TransferProgress*) : LibC::Int
  fun indexer_stream_finalize = git_indexer_stream_finalize(idx : X_IndexerStream, stats : TransferProgress*) : LibC::Int
  fun indexer_stream_hash = git_indexer_stream_hash(idx : X_IndexerStream) : Oid*
  fun indexer_stream_free = git_indexer_stream_free(idx : X_IndexerStream)
  struct IndexEntry
    ctime : IndexTime
    mtime : IndexTime
    dev : LibC::UInt
    ino : LibC::UInt
    mode : LibC::UInt
    uid : LibC::UInt
    gid : LibC::UInt
    file_size : OffT
    oid : Oid
    flags : LibC::UShort
    flags_extended : LibC::UShort
    path : LibC::Char*
  end
  struct IndexTime
    seconds : TimeT
    nanoseconds : LibC::UInt
  end
  IndexcapIgnoreCase = 1
  IndexcapNoFilemode = 2
  IndexcapNoSymlinks = 4
  IndexcapFromOwner = -1
  IndexAddDefault = 0
  IndexAddForce = 1
  IndexAddDisablePathspecMatch = 2
  IndexAddCheckPathspec = 4
  fun index_open = git_index_open(out : X_Index*, index_path : LibC::Char*) : LibC::Int
  fun index_new = git_index_new(out : X_Index*) : LibC::Int
  fun index_free = git_index_free(index : X_Index)
  fun index_owner = git_index_owner(index : X_Index) : X_Repository
  fun index_caps = git_index_caps(index : X_Index) : LibC::UInt
  fun index_set_caps = git_index_set_caps(index : X_Index, caps : LibC::UInt) : LibC::Int
  fun index_read = git_index_read(index : X_Index) : LibC::Int
  fun index_write = git_index_write(index : X_Index) : LibC::Int
  fun index_read_tree = git_index_read_tree(index : X_Index, tree : X_Tree) : LibC::Int
  fun index_write_tree = git_index_write_tree(out : Oid*, index : X_Index) : LibC::Int
  fun index_write_tree_to = git_index_write_tree_to(out : Oid*, index : X_Index, repo : X_Repository) : LibC::Int
  fun index_entrycount = git_index_entrycount(index : X_Index) : LibC::SizeT
  fun index_clear = git_index_clear(index : X_Index)
  fun index_get_byindex = git_index_get_byindex(index : X_Index, n : LibC::SizeT) : IndexEntry*
  fun index_get_bypath = git_index_get_bypath(index : X_Index, path : LibC::Char*, stage : LibC::Int) : IndexEntry*
  fun index_remove = git_index_remove(index : X_Index, path : LibC::Char*, stage : LibC::Int) : LibC::Int
  fun index_remove_directory = git_index_remove_directory(index : X_Index, dir : LibC::Char*, stage : LibC::Int) : LibC::Int
  fun index_add = git_index_add(index : X_Index, source_entry : IndexEntry*) : LibC::Int
  fun index_entry_stage = git_index_entry_stage(entry : IndexEntry*) : LibC::Int
  fun index_add_bypath = git_index_add_bypath(index : X_Index, path : LibC::Char*) : LibC::Int
  fun index_remove_bypath = git_index_remove_bypath(index : X_Index, path : LibC::Char*) : LibC::Int
  fun index_add_all = git_index_add_all(index : X_Index, pathspec : Strarray*, flags : LibC::UInt, callback : IndexMatchedPathCb, payload : Void*) : LibC::Int
  alias IndexMatchedPathCb = (LibC::Char*, LibC::Char*, Void* -> LibC::Int)
  fun index_remove_all = git_index_remove_all(index : X_Index, pathspec : Strarray*, callback : IndexMatchedPathCb, payload : Void*) : LibC::Int
  fun index_update_all = git_index_update_all(index : X_Index, pathspec : Strarray*, callback : IndexMatchedPathCb, payload : Void*) : LibC::Int
  fun index_find = git_index_find(at_pos : LibC::SizeT*, index : X_Index, path : LibC::Char*) : LibC::Int
  fun index_conflict_add = git_index_conflict_add(index : X_Index, ancestor_entry : IndexEntry*, our_entry : IndexEntry*, their_entry : IndexEntry*) : LibC::Int
  fun index_conflict_get = git_index_conflict_get(ancestor_out : IndexEntry**, our_out : IndexEntry**, their_out : IndexEntry**, index : X_Index, path : LibC::Char*) : LibC::Int
  fun index_conflict_remove = git_index_conflict_remove(index : X_Index, path : LibC::Char*) : LibC::Int
  fun index_conflict_cleanup = git_index_conflict_cleanup(index : X_Index)
  fun index_has_conflicts = git_index_has_conflicts(index : X_Index) : LibC::Int
  fun index_conflict_iterator_new = git_index_conflict_iterator_new(iterator_out : X_IndexConflictIterator*, index : X_Index) : LibC::Int
  type X_IndexConflictIterator = Void*
  fun index_conflict_next = git_index_conflict_next(ancestor_out : IndexEntry**, our_out : IndexEntry**, their_out : IndexEntry**, iterator : X_IndexConflictIterator) : LibC::Int
  fun index_conflict_iterator_free = git_index_conflict_iterator_free(iterator : X_IndexConflictIterator)
  MergeTreeFindRenames = 1
  MergeAutomergeNormal = 0
  MergeAutomergeNone = 1
  MergeAutomergeFavorOurs = 2
  MergeAutomergeFavorTheirs = 3
  fun merge_base = git_merge_base(out : Oid*, repo : X_Repository, one : Oid*, two : Oid*) : LibC::Int
  fun merge_base_many = git_merge_base_many(out : Oid*, repo : X_Repository, input_array : Oid*, length : LibC::SizeT) : LibC::Int
  fun merge_head_from_ref = git_merge_head_from_ref(out : X_MergeHead*, repo : X_Repository, ref : X_Reference) : LibC::Int
  type X_MergeHead = Void*
  fun merge_head_from_fetchhead = git_merge_head_from_fetchhead(out : X_MergeHead*, repo : X_Repository, branch_name : LibC::Char*, remote_url : LibC::Char*, oid : Oid*) : LibC::Int
  fun merge_head_from_oid = git_merge_head_from_oid(out : X_MergeHead*, repo : X_Repository, oid : Oid*) : LibC::Int
  fun merge_head_free = git_merge_head_free(head : X_MergeHead)
  fun merge_trees = git_merge_trees(out : X_Index*, repo : X_Repository, ancestor_tree : X_Tree, our_tree : X_Tree, their_tree : X_Tree, opts : MergeTreeOpts*) : LibC::Int
  struct MergeTreeOpts
    version : LibC::UInt
    flags : MergeTreeFlagT
    rename_threshold : LibC::UInt
    target_limit : LibC::UInt
    metric : DiffSimilarityMetric*
    automerge_flags : MergeAutomergeFlags
  end
  enum MergeTreeFlagT
    MergeTreeFindRenames = 1
  end
  enum MergeAutomergeFlags
    MergeAutomergeNormal = 0
    MergeAutomergeNone = 1
    MergeAutomergeFavorOurs = 2
    MergeAutomergeFavorTheirs = 3
  end
  fun graph_ahead_behind = git_graph_ahead_behind(ahead : LibC::SizeT*, behind : LibC::SizeT*, repo : X_Repository, local : Oid*, upstream : Oid*) : LibC::Int
  fun reflog_read = git_reflog_read(out : X_Reflog*, ref : X_Reference) : LibC::Int
  type X_Reflog = Void*
  fun reflog_write = git_reflog_write(reflog : X_Reflog) : LibC::Int
  fun reflog_append = git_reflog_append(reflog : X_Reflog, id : Oid*, committer : Signature*, msg : LibC::Char*) : LibC::Int
  fun reflog_rename = git_reflog_rename(ref : X_Reference, name : LibC::Char*) : LibC::Int
  fun reflog_delete = git_reflog_delete(ref : X_Reference) : LibC::Int
  fun reflog_entrycount = git_reflog_entrycount(reflog : X_Reflog) : LibC::SizeT
  fun reflog_entry_byindex = git_reflog_entry_byindex(reflog : X_Reflog, idx : LibC::SizeT) : X_ReflogEntry
  type X_ReflogEntry = Void*
  fun reflog_drop = git_reflog_drop(reflog : X_Reflog, idx : LibC::SizeT, rewrite_previous_entry : LibC::Int) : LibC::Int
  fun reflog_entry_id_old = git_reflog_entry_id_old(entry : X_ReflogEntry) : Oid*
  fun reflog_entry_id_new = git_reflog_entry_id_new(entry : X_ReflogEntry) : Oid*
  fun reflog_entry_committer = git_reflog_entry_committer(entry : X_ReflogEntry) : Signature*
  fun reflog_entry_message = git_reflog_entry_message(entry : X_ReflogEntry) : LibC::Char*
  fun reflog_free = git_reflog_free(reflog : X_Reflog)
  fun revparse_single = git_revparse_single(out : X_Object*, repo : X_Repository, spec : LibC::Char*) : LibC::Int
  fun revparse_ext = git_revparse_ext(object_out : X_Object*, reference_out : X_Reference*, repo : X_Repository, spec : LibC::Char*) : LibC::Int
  RevparseSingle = 1
  RevparseRange = 2
  RevparseMergeBase = 4
  fun revparse = git_revparse(revspec : Revspec*, repo : X_Repository, spec : LibC::Char*) : LibC::Int
  struct Revspec
    from : X_Object
    to : X_Object
    flags : LibC::UInt
  end
  fun blob_lookup = git_blob_lookup(blob : X_Blob*, repo : X_Repository, id : Oid*) : LibC::Int
  fun blob_lookup_prefix = git_blob_lookup_prefix(blob : X_Blob*, repo : X_Repository, id : Oid*, len : LibC::SizeT) : LibC::Int
  fun blob_free = git_blob_free(blob : X_Blob)
  fun blob_id = git_blob_id(blob : X_Blob) : Oid*
  fun blob_owner = git_blob_owner(blob : X_Blob) : X_Repository
  fun blob_rawcontent = git_blob_rawcontent(blob : X_Blob) : Void*
  fun blob_rawsize = git_blob_rawsize(blob : X_Blob) : OffT
  fun blob_create_fromworkdir = git_blob_create_fromworkdir(id : Oid*, repo : X_Repository, relative_path : LibC::Char*) : LibC::Int
  fun blob_create_fromdisk = git_blob_create_fromdisk(id : Oid*, repo : X_Repository, path : LibC::Char*) : LibC::Int
  fun blob_create_fromchunks = git_blob_create_fromchunks(id : Oid*, repo : X_Repository, hintpath : LibC::Char*, callback : BlobChunkCb, payload : Void*) : LibC::Int
  alias BlobChunkCb = (LibC::Char*, LibC::SizeT, Void* -> LibC::Int)
  fun blob_create_frombuffer = git_blob_create_frombuffer(oid : Oid*, repo : X_Repository, buffer : Void*, len : LibC::SizeT) : LibC::Int
  fun blob_is_binary = git_blob_is_binary(blob : X_Blob) : LibC::Int
  fun commit_lookup = git_commit_lookup(commit : X_Commit*, repo : X_Repository, id : Oid*) : LibC::Int
  type X_Commit = Void*
  fun commit_lookup_prefix = git_commit_lookup_prefix(commit : X_Commit*, repo : X_Repository, id : Oid*, len : LibC::SizeT) : LibC::Int
  fun commit_free = git_commit_free(commit : X_Commit)
  fun commit_id = git_commit_id(commit : X_Commit) : Oid*
  fun commit_owner = git_commit_owner(commit : X_Commit) : X_Repository
  fun commit_message_encoding = git_commit_message_encoding(commit : X_Commit) : LibC::Char*
  fun commit_message = git_commit_message(commit : X_Commit) : LibC::Char*
  fun commit_time = git_commit_time(commit : X_Commit) : TimeT
  fun commit_time_offset = git_commit_time_offset(commit : X_Commit) : LibC::Int
  fun commit_committer = git_commit_committer(commit : X_Commit) : Signature*
  fun commit_author = git_commit_author(commit : X_Commit) : Signature*
  fun commit_tree = git_commit_tree(tree_out : X_Tree*, commit : X_Commit) : LibC::Int
  fun commit_tree_id = git_commit_tree_id(commit : X_Commit) : Oid*
  fun commit_parentcount = git_commit_parentcount(commit : X_Commit) : LibC::UInt
  fun commit_parent = git_commit_parent(out : X_Commit*, commit : X_Commit, n : LibC::UInt) : LibC::Int
  fun commit_parent_id = git_commit_parent_id(commit : X_Commit, n : LibC::UInt) : Oid*
  fun commit_nth_gen_ancestor = git_commit_nth_gen_ancestor(ancestor : X_Commit*, commit : X_Commit, n : LibC::UInt) : LibC::Int
  fun commit_create = git_commit_create(id : Oid*, repo : X_Repository, update_ref : LibC::Char*, author : Signature*, committer : Signature*, message_encoding : LibC::Char*, message : LibC::Char*, tree : X_Tree, parent_count : LibC::Int, parents : X_Commit*) : LibC::Int
  fun commit_create_v = git_commit_create_v(id : Oid*, repo : X_Repository, update_ref : LibC::Char*, author : Signature*, committer : Signature*, message_encoding : LibC::Char*, message : LibC::Char*, tree : X_Tree, parent_count : LibC::Int, ...) : LibC::Int
  fun tag_lookup = git_tag_lookup(out : X_Tag*, repo : X_Repository, id : Oid*) : LibC::Int
  type X_Tag = Void*
  fun tag_lookup_prefix = git_tag_lookup_prefix(out : X_Tag*, repo : X_Repository, id : Oid*, len : LibC::SizeT) : LibC::Int
  fun tag_free = git_tag_free(tag : X_Tag)
  fun tag_id = git_tag_id(tag : X_Tag) : Oid*
  fun tag_owner = git_tag_owner(tag : X_Tag) : X_Repository
  fun tag_target = git_tag_target(target_out : X_Object*, tag : X_Tag) : LibC::Int
  fun tag_target_id = git_tag_target_id(tag : X_Tag) : Oid*
  fun tag_target_type = git_tag_target_type(tag : X_Tag) : Otype
  fun tag_name = git_tag_name(tag : X_Tag) : LibC::Char*
  fun tag_tagger = git_tag_tagger(tag : X_Tag) : Signature*
  fun tag_message = git_tag_message(tag : X_Tag) : LibC::Char*
  fun tag_create = git_tag_create(oid : Oid*, repo : X_Repository, tag_name : LibC::Char*, target : X_Object, tagger : Signature*, message : LibC::Char*, force : LibC::Int) : LibC::Int
  fun tag_annotation_create = git_tag_annotation_create(oid : Oid*, repo : X_Repository, tag_name : LibC::Char*, target : X_Object, tagger : Signature*, message : LibC::Char*) : LibC::Int
  fun tag_create_frombuffer = git_tag_create_frombuffer(oid : Oid*, repo : X_Repository, buffer : LibC::Char*, force : LibC::Int) : LibC::Int
  fun tag_create_lightweight = git_tag_create_lightweight(oid : Oid*, repo : X_Repository, tag_name : LibC::Char*, target : X_Object, force : LibC::Int) : LibC::Int
  fun tag_delete = git_tag_delete(repo : X_Repository, tag_name : LibC::Char*) : LibC::Int
  fun tag_list = git_tag_list(tag_names : Strarray*, repo : X_Repository) : LibC::Int
  fun tag_list_match = git_tag_list_match(tag_names : Strarray*, pattern : LibC::Char*, repo : X_Repository) : LibC::Int
  fun tag_foreach = git_tag_foreach(repo : X_Repository, callback : TagForeachCb, payload : Void*) : LibC::Int
  alias TagForeachCb = (LibC::Char*, Oid*, Void* -> LibC::Int)
  fun tag_peel = git_tag_peel(tag_target_out : X_Object*, tag : X_Tag) : LibC::Int
  ConfigLevelSystem = 1
  ConfigLevelXdg = 2
  ConfigLevelGlobal = 3
  ConfigLevelLocal = 4
  ConfigLevelApp = 5
  ConfigHighestLevel = -1
  CvarFalse = 0
  CvarTrue = 1
  CvarInt32 = 2
  CvarString = 3
  fun config_find_global = git_config_find_global(out : LibC::Char*, length : LibC::SizeT) : LibC::Int
  fun config_find_xdg = git_config_find_xdg(out : LibC::Char*, length : LibC::SizeT) : LibC::Int
  fun config_find_system = git_config_find_system(out : LibC::Char*, length : LibC::SizeT) : LibC::Int
  fun config_open_default = git_config_open_default(out : X_Config*) : LibC::Int
  fun config_new = git_config_new(out : X_Config*) : LibC::Int
  fun config_add_file_ondisk = git_config_add_file_ondisk(cfg : X_Config, path : LibC::Char*, level : ConfigLevelT, force : LibC::Int) : LibC::Int
  enum ConfigLevelT
    ConfigLevelSystem = 1
    ConfigLevelXdg = 2
    ConfigLevelGlobal = 3
    ConfigLevelLocal = 4
    ConfigLevelApp = 5
    ConfigHighestLevel = -1
  end
  fun config_open_ondisk = git_config_open_ondisk(out : X_Config*, path : LibC::Char*) : LibC::Int
  fun config_open_level = git_config_open_level(out : X_Config*, parent : X_Config, level : ConfigLevelT) : LibC::Int
  fun config_open_global = git_config_open_global(out : X_Config*, config : X_Config) : LibC::Int
  fun config_refresh = git_config_refresh(cfg : X_Config) : LibC::Int
  fun config_free = git_config_free(cfg : X_Config)
  fun config_get_entry = git_config_get_entry(out : ConfigEntry**, cfg : X_Config, name : LibC::Char*) : LibC::Int
  struct ConfigEntry
    name : LibC::Char*
    value : LibC::Char*
    level : ConfigLevelT
  end
  fun config_get_int32 = git_config_get_int32(out : Int32T*, cfg : X_Config, name : LibC::Char*) : LibC::Int
  alias Int32T = LibC::Int
  fun config_get_int64 = git_config_get_int64(out : Int64T*, cfg : X_Config, name : LibC::Char*) : LibC::Int
  fun config_get_bool = git_config_get_bool(out : LibC::Int*, cfg : X_Config, name : LibC::Char*) : LibC::Int
  fun config_get_string = git_config_get_string(out : LibC::Char**, cfg : X_Config, name : LibC::Char*) : LibC::Int
  fun config_get_multivar = git_config_get_multivar(cfg : X_Config, name : LibC::Char*, regexp : LibC::Char*, callback : ConfigForeachCb, payload : Void*) : LibC::Int
  alias ConfigForeachCb = (ConfigEntry*, Void* -> LibC::Int)
  fun config_set_int32 = git_config_set_int32(cfg : X_Config, name : LibC::Char*, value : Int32T) : LibC::Int
  fun config_set_int64 = git_config_set_int64(cfg : X_Config, name : LibC::Char*, value : Int64T) : LibC::Int
  fun config_set_bool = git_config_set_bool(cfg : X_Config, name : LibC::Char*, value : LibC::Int) : LibC::Int
  fun config_set_string = git_config_set_string(cfg : X_Config, name : LibC::Char*, value : LibC::Char*) : LibC::Int
  fun config_set_multivar = git_config_set_multivar(cfg : X_Config, name : LibC::Char*, regexp : LibC::Char*, value : LibC::Char*) : LibC::Int
  fun config_delete_entry = git_config_delete_entry(cfg : X_Config, name : LibC::Char*) : LibC::Int
  fun config_foreach = git_config_foreach(cfg : X_Config, callback : ConfigForeachCb, payload : Void*) : LibC::Int
  fun config_foreach_match = git_config_foreach_match(cfg : X_Config, regexp : LibC::Char*, callback : ConfigForeachCb, payload : Void*) : LibC::Int
  fun config_get_mapped = git_config_get_mapped(out : LibC::Int*, cfg : X_Config, name : LibC::Char*, maps : CvarMap*, map_n : LibC::SizeT) : LibC::Int
  struct CvarMap
    cvar_type : CvarT
    str_match : LibC::Char*
    map_value : LibC::Int
  end
  enum CvarT
    CvarFalse = 0
    CvarTrue = 1
    CvarInt32 = 2
    CvarString = 3
  end
  fun config_lookup_map_value = git_config_lookup_map_value(out : LibC::Int*, maps : CvarMap*, map_n : LibC::SizeT, value : LibC::Char*) : LibC::Int
  fun config_parse_bool = git_config_parse_bool(out : LibC::Int*, value : LibC::Char*) : LibC::Int
  fun config_parse_int32 = git_config_parse_int32(out : Int32T*, value : LibC::Char*) : LibC::Int
  fun config_parse_int64 = git_config_parse_int64(out : Int64T*, value : LibC::Char*) : LibC::Int
  DirectionFetch = 0
  DirectionPush = 1
  CredtypeUserpassPlaintext = 1
  CredtypeSshKeyfilePassphrase = 2
  CredtypeSshPublickey = 3
  struct Cred
    credtype : CredtypeT
    free : (Cred* -> Void)
  end
  enum CredtypeT
    CredtypeUserpassPlaintext = 1
    CredtypeSshKeyfilePassphrase = 2
    CredtypeSshPublickey = 3
  end
  struct CredUserpassPlaintext
    parent : Cred
    username : LibC::Char*
    password : LibC::Char*
  end
  fun cred_userpass_plaintext_new = git_cred_userpass_plaintext_new(out : Cred**, username : LibC::Char*, password : LibC::Char*) : LibC::Int
  TransportflagsNone = 0
  TransportflagsNoCheckCert = 1
  struct Transport
    version : LibC::UInt
    set_callbacks : (Transport*, TransportMessageCb, TransportMessageCb, Void* -> LibC::Int)
    connect : (Transport*, LibC::Char*, CredAcquireCb, Void*, LibC::Int, LibC::Int -> LibC::Int)
    ls : (Transport*, HeadlistCb, Void* -> LibC::Int)
    push : (Transport*, X_Push -> LibC::Int)
    negotiate_fetch : (Transport*, X_Repository, RemoteHead**, LibC::SizeT -> LibC::Int)
    download_pack : (Transport*, X_Repository, TransferProgress*, TransferProgressCallback, Void* -> LibC::Int)
    is_connected : (Transport* -> LibC::Int)
    read_flags : (Transport*, LibC::Int* -> LibC::Int)
    cancel : (Transport* -> Void)
    close : (Transport* -> LibC::Int)
    free : (Transport* -> Void)
  end
  alias TransportMessageCb = (LibC::Char*, LibC::Int, Void* -> Void)
  alias CredAcquireCb = (Cred**, LibC::Char*, LibC::Char*, LibC::UInt, Void* -> LibC::Int)
  alias HeadlistCb = (RemoteHead*, Void* -> LibC::Int)
  type X_Push = Void*
  fun transport_new = git_transport_new(out : Transport**, owner : X_Remote, url : LibC::Char*) : LibC::Int
  type X_Remote = Void*
  fun transport_dummy = git_transport_dummy(out : Transport**, owner : X_Remote, payload : Void*) : LibC::Int
  fun transport_local = git_transport_local(out : Transport**, owner : X_Remote, payload : Void*) : LibC::Int
  fun transport_smart = git_transport_smart(out : Transport**, owner : X_Remote, payload : Void*) : LibC::Int
  ServiceUploadpackLs = 1
  ServiceUploadpack = 2
  ServiceReceivepackLs = 3
  ServiceReceivepack = 4
  struct SmartSubtransport
    action : (SmartSubtransportStream**, SmartSubtransport*, LibC::Char*, SmartServiceT -> LibC::Int)
    close : (SmartSubtransport* -> LibC::Int)
    free : (SmartSubtransport* -> Void)
  end
  struct SmartSubtransportStream
    subtransport : SmartSubtransport*
    read : (SmartSubtransportStream*, LibC::Char*, LibC::SizeT, LibC::SizeT* -> LibC::Int)
    write : (SmartSubtransportStream*, LibC::Char*, LibC::SizeT -> LibC::Int)
    free : (SmartSubtransportStream* -> Void)
  end
  enum SmartServiceT
    ServiceUploadpackLs = 1
    ServiceUploadpack = 2
    ServiceReceivepackLs = 3
    ServiceReceivepack = 4
  end
  struct SmartSubtransportDefinition
    callback : SmartSubtransportCb
    rpc : LibC::UInt
  end
  alias SmartSubtransportCb = (SmartSubtransport**, Transport* -> LibC::Int)
  fun smart_subtransport_http = git_smart_subtransport_http(out : SmartSubtransport**, owner : Transport*) : LibC::Int
  fun smart_subtransport_git = git_smart_subtransport_git(out : SmartSubtransport**, owner : Transport*) : LibC::Int
  fun smart_subtransport_ssh = git_smart_subtransport_ssh(out : SmartSubtransport**, owner : Transport*) : LibC::Int
  fun refspec_src = git_refspec_src(refspec : X_Refspec) : LibC::Char*
  type X_Refspec = Void*
  fun refspec_dst = git_refspec_dst(refspec : X_Refspec) : LibC::Char*
  fun refspec_string = git_refspec_string(refspec : X_Refspec) : LibC::Char*
  fun refspec_force = git_refspec_force(refspec : X_Refspec) : LibC::Int
  fun refspec_direction = git_refspec_direction(spec : X_Refspec) : Direction
  enum Direction
    DirectionFetch = 0
    DirectionPush = 1
  end
  fun refspec_src_matches = git_refspec_src_matches(refspec : X_Refspec, refname : LibC::Char*) : LibC::Int
  fun refspec_dst_matches = git_refspec_dst_matches(refspec : X_Refspec, refname : LibC::Char*) : LibC::Int
  fun refspec_transform = git_refspec_transform(out : LibC::Char*, outlen : LibC::SizeT, spec : X_Refspec, name : LibC::Char*) : LibC::Int
  fun refspec_rtransform = git_refspec_rtransform(out : LibC::Char*, outlen : LibC::SizeT, spec : X_Refspec, name : LibC::Char*) : LibC::Int
  fun remote_create = git_remote_create(out : X_Remote*, repo : X_Repository, name : LibC::Char*, url : LibC::Char*) : LibC::Int
  fun remote_create_inmemory = git_remote_create_inmemory(out : X_Remote*, repo : X_Repository, fetch : LibC::Char*, url : LibC::Char*) : LibC::Int
  fun remote_load = git_remote_load(out : X_Remote*, repo : X_Repository, name : LibC::Char*) : LibC::Int
  fun remote_save = git_remote_save(remote : X_Remote) : LibC::Int
  fun remote_name = git_remote_name(remote : X_Remote) : LibC::Char*
  fun remote_url = git_remote_url(remote : X_Remote) : LibC::Char*
  fun remote_pushurl = git_remote_pushurl(remote : X_Remote) : LibC::Char*
  fun remote_set_url = git_remote_set_url(remote : X_Remote, url : LibC::Char*) : LibC::Int
  fun remote_set_pushurl = git_remote_set_pushurl(remote : X_Remote, url : LibC::Char*) : LibC::Int
  fun remote_add_fetch = git_remote_add_fetch(remote : X_Remote, refspec : LibC::Char*) : LibC::Int
  fun remote_get_fetch_refspecs = git_remote_get_fetch_refspecs(array : Strarray*, remote : X_Remote) : LibC::Int
  fun remote_add_push = git_remote_add_push(remote : X_Remote, refspec : LibC::Char*) : LibC::Int
  fun remote_get_push_refspecs = git_remote_get_push_refspecs(array : Strarray*, remote : X_Remote) : LibC::Int
  fun remote_clear_refspecs = git_remote_clear_refspecs(remote : X_Remote)
  fun remote_refspec_count = git_remote_refspec_count(remote : X_Remote) : LibC::SizeT
  fun remote_get_refspec = git_remote_get_refspec(remote : X_Remote, n : LibC::SizeT) : X_Refspec
  fun remote_remove_refspec = git_remote_remove_refspec(remote : X_Remote, n : LibC::SizeT) : LibC::Int
  fun remote_connect = git_remote_connect(remote : X_Remote, direction : Direction) : LibC::Int
  fun remote_ls = git_remote_ls(remote : X_Remote, list_cb : HeadlistCb, payload : Void*) : LibC::Int
  fun remote_download = git_remote_download(remote : X_Remote, progress_cb : TransferProgressCallback, payload : Void*) : LibC::Int
  fun remote_connected = git_remote_connected(remote : X_Remote) : LibC::Int
  fun remote_stop = git_remote_stop(remote : X_Remote)
  fun remote_disconnect = git_remote_disconnect(remote : X_Remote)
  fun remote_free = git_remote_free(remote : X_Remote)
  fun remote_update_tips = git_remote_update_tips(remote : X_Remote) : LibC::Int
  fun remote_valid_url = git_remote_valid_url(url : LibC::Char*) : LibC::Int
  fun remote_supported_url = git_remote_supported_url(url : LibC::Char*) : LibC::Int
  fun remote_list = git_remote_list(out : Strarray*, repo : X_Repository) : LibC::Int
  fun remote_check_cert = git_remote_check_cert(remote : X_Remote, check : LibC::Int)
  fun remote_set_cred_acquire_cb = git_remote_set_cred_acquire_cb(remote : X_Remote, cred_acquire_cb : CredAcquireCb, payload : Void*)
  fun remote_set_transport = git_remote_set_transport(remote : X_Remote, transport : Transport*) : LibC::Int
  fun remote_set_callbacks = git_remote_set_callbacks(remote : X_Remote, callbacks : RemoteCallbacks*) : LibC::Int
  fun remote_stats = git_remote_stats(remote : X_Remote) : TransferProgress*
  RemoteDownloadTagsAuto = 0
  RemoteDownloadTagsNone = 1
  RemoteDownloadTagsAll = 2
  fun remote_autotag = git_remote_autotag(remote : X_Remote) : RemoteAutotagOptionT
  enum RemoteAutotagOptionT
    RemoteDownloadTagsAuto = 0
    RemoteDownloadTagsNone = 1
    RemoteDownloadTagsAll = 2
  end
  fun remote_set_autotag = git_remote_set_autotag(remote : X_Remote, value : RemoteAutotagOptionT)
  fun remote_rename = git_remote_rename(remote : X_Remote, new_name : LibC::Char*, callback : RemoteRenameProblemCb, payload : Void*) : LibC::Int
  alias RemoteRenameProblemCb = (LibC::Char*, Void* -> LibC::Int)
  fun remote_update_fetchhead = git_remote_update_fetchhead(remote : X_Remote) : LibC::Int
  fun remote_set_update_fetchhead = git_remote_set_update_fetchhead(remote : X_Remote, value : LibC::Int)
  fun remote_is_valid_name = git_remote_is_valid_name(remote_name : LibC::Char*) : LibC::Int
  struct CloneOptions
    version : LibC::UInt
    checkout_opts : CheckoutOpts
    bare : LibC::Int
    fetch_progress_cb : TransferProgressCallback
    fetch_progress_payload : Void*
    remote_name : LibC::Char*
    pushurl : LibC::Char*
    fetch_spec : LibC::Char*
    push_spec : LibC::Char*
    cred_acquire_cb : CredAcquireCb
    cred_acquire_payload : Void*
    transport_flags : TransportFlagsT
    transport : Transport*
    remote_callbacks : RemoteCallbacks*
    remote_autotag : RemoteAutotagOptionT
    checkout_branch : LibC::Char*
  end
  enum TransportFlagsT
    TransportflagsNone = 0
    TransportflagsNoCheckCert = 1
  end
  fun clone = git_clone(out : X_Repository*, url : LibC::Char*, local_path : LibC::Char*, options : CloneOptions*) : LibC::Int
  fun push_new = git_push_new(out : X_Push*, remote : X_Remote) : LibC::Int
  fun push_set_options = git_push_set_options(push : X_Push, opts : PushOptions*) : LibC::Int
  struct PushOptions
    version : LibC::UInt
    pb_parallelism : LibC::UInt
  end
  fun push_add_refspec = git_push_add_refspec(push : X_Push, refspec : LibC::Char*) : LibC::Int
  fun push_update_tips = git_push_update_tips(push : X_Push) : LibC::Int
  fun push_finish = git_push_finish(push : X_Push) : LibC::Int
  fun push_unpack_ok = git_push_unpack_ok(push : X_Push) : LibC::Int
  fun push_status_foreach = git_push_status_foreach(push : X_Push, cb : (LibC::Char*, LibC::Char*, Void* -> LibC::Int), data : Void*) : LibC::Int
  fun push_free = git_push_free(push : X_Push)
  AttrUnspecifiedT = 0
  AttrTrueT = 1
  AttrFalseT = 2
  AttrValueT = 3
  fun attr_value = git_attr_value(attr : LibC::Char*) : AttrT
  enum AttrT
    AttrUnspecifiedT = 0
    AttrTrueT = 1
    AttrFalseT = 2
    AttrValueT = 3
  end
  fun attr_get = git_attr_get(value_out : LibC::Char**, repo : X_Repository, flags : Uint32T, path : LibC::Char*, name : LibC::Char*) : LibC::Int
  fun attr_get_many = git_attr_get_many(values_out : LibC::Char**, repo : X_Repository, flags : Uint32T, path : LibC::Char*, num_attr : LibC::SizeT, names : LibC::Char**) : LibC::Int
  fun attr_foreach = git_attr_foreach(repo : X_Repository, flags : Uint32T, path : LibC::Char*, callback : AttrForeachCb, payload : Void*) : LibC::Int
  alias AttrForeachCb = (LibC::Char*, LibC::Char*, Void* -> LibC::Int)
  fun attr_cache_flush = git_attr_cache_flush(repo : X_Repository)
  fun attr_add_macro = git_attr_add_macro(repo : X_Repository, name : LibC::Char*, values : LibC::Char*) : LibC::Int
  fun ignore_add_rule = git_ignore_add_rule(repo : X_Repository, rules : LibC::Char*) : LibC::Int
  fun ignore_clear_internal_rules = git_ignore_clear_internal_rules(repo : X_Repository) : LibC::Int
  fun ignore_path_is_ignored = git_ignore_path_is_ignored(ignored : LibC::Int*, repo : X_Repository, path : LibC::Char*) : LibC::Int
  fun branch_create = git_branch_create(out : X_Reference*, repo : X_Repository, branch_name : LibC::Char*, target : X_Commit, force : LibC::Int) : LibC::Int
  fun branch_delete = git_branch_delete(branch : X_Reference) : LibC::Int
  fun branch_foreach = git_branch_foreach(repo : X_Repository, list_flags : LibC::UInt, branch_cb : BranchForeachCb, payload : Void*) : LibC::Int
  enum BranchT
    BranchLocal = 1
    BranchRemote = 2
  end
  alias BranchForeachCb = (LibC::Char*, BranchT, Void* -> LibC::Int)
  fun branch_move = git_branch_move(out : X_Reference*, branch : X_Reference, new_branch_name : LibC::Char*, force : LibC::Int) : LibC::Int
  fun branch_lookup = git_branch_lookup(out : X_Reference*, repo : X_Repository, branch_name : LibC::Char*, branch_type : BranchT) : LibC::Int
  fun branch_name = git_branch_name(out : LibC::Char**, ref : X_Reference) : LibC::Int
  fun branch_upstream = git_branch_upstream(out : X_Reference*, branch : X_Reference) : LibC::Int
  fun branch_set_upstream = git_branch_set_upstream(branch : X_Reference, upstream_name : LibC::Char*) : LibC::Int
  fun branch_upstream_name = git_branch_upstream_name(tracking_branch_name_out : LibC::Char*, buffer_size : LibC::SizeT, repo : X_Repository, canonical_branch_name : LibC::Char*) : LibC::Int
  fun branch_is_head = git_branch_is_head(branch : X_Reference) : LibC::Int
  fun branch_remote_name = git_branch_remote_name(remote_name_out : LibC::Char*, buffer_size : LibC::SizeT, repo : X_Repository, canonical_branch_name : LibC::Char*) : LibC::Int
  StatusCurrent = 0
  StatusIndexNew = 1
  StatusIndexModified = 2
  StatusIndexDeleted = 4
  StatusIndexRenamed = 8
  StatusIndexTypechange = 16
  StatusWtNew = 128
  StatusWtModified = 256
  StatusWtDeleted = 512
  StatusWtTypechange = 1024
  StatusWtRenamed = 2048
  StatusIgnored = 16384
  StatusShowIndexAndWorkdir = 0
  StatusShowIndexOnly = 1
  StatusShowWorkdirOnly = 2
  StatusShowIndexThenWorkdir = 3
  StatusOptIncludeUntracked = 1
  StatusOptIncludeIgnored = 2
  StatusOptIncludeUnmodified = 4
  StatusOptExcludeSubmodules = 8
  StatusOptRecurseUntrackedDirs = 16
  StatusOptDisablePathspecMatch = 32
  StatusOptRecurseIgnoredDirs = 64
  StatusOptRenamesHeadToIndex = 128
  StatusOptRenamesIndexToWorkdir = 256
  StatusOptSortCaseSensitively = 512
  StatusOptSortCaseInsensitively = 1024
  fun status_foreach = git_status_foreach(repo : X_Repository, callback : StatusCb, payload : Void*) : LibC::Int
  alias StatusCb = (LibC::Char*, LibC::UInt, Void* -> LibC::Int)
  fun status_foreach_ext = git_status_foreach_ext(repo : X_Repository, opts : StatusOptions*, callback : StatusCb, payload : Void*) : LibC::Int
  struct StatusOptions
    version : LibC::UInt
    show : StatusShowT
    flags : LibC::UInt
    pathspec : Strarray
  end
  enum StatusShowT
    StatusShowIndexAndWorkdir = 0
    StatusShowIndexOnly = 1
    StatusShowWorkdirOnly = 2
    StatusShowIndexThenWorkdir = 3
  end
  fun status_file = git_status_file(status_flags : LibC::UInt*, repo : X_Repository, path : LibC::Char*) : LibC::Int
  fun status_list_new = git_status_list_new(out : X_StatusList*, repo : X_Repository, opts : StatusOptions*) : LibC::Int
  type X_StatusList = Void*
  fun status_list_entrycount = git_status_list_entrycount(statuslist : X_StatusList) : LibC::SizeT
  fun status_byindex = git_status_byindex(statuslist : X_StatusList, idx : LibC::SizeT) : StatusEntry*
  struct StatusEntry
    status : StatusT
    head_to_index : DiffDelta*
    index_to_workdir : DiffDelta*
  end
  enum StatusT
    StatusCurrent = 0
    StatusIndexNew = 1
    StatusIndexModified = 2
    StatusIndexDeleted = 4
    StatusIndexRenamed = 8
    StatusIndexTypechange = 16
    StatusWtNew = 128
    StatusWtModified = 256
    StatusWtDeleted = 512
    StatusWtTypechange = 1024
    StatusWtRenamed = 2048
    StatusIgnored = 16384
  end
  fun status_list_free = git_status_list_free(statuslist : X_StatusList)
  fun status_should_ignore = git_status_should_ignore(ignored : LibC::Int*, repo : X_Repository, path : LibC::Char*) : LibC::Int
  alias Submodule = Void
  SubmoduleUpdateDefault = -1
  SubmoduleUpdateCheckout = 0
  SubmoduleUpdateRebase = 1
  SubmoduleUpdateMerge = 2
  SubmoduleUpdateNone = 3
  SubmoduleIgnoreDefault = -1
  SubmoduleIgnoreNone = 0
  SubmoduleIgnoreUntracked = 1
  SubmoduleIgnoreDirty = 2
  SubmoduleIgnoreAll = 3
  SubmoduleStatusInHead = 1
  SubmoduleStatusInIndex = 2
  SubmoduleStatusInConfig = 4
  SubmoduleStatusInWd = 8
  SubmoduleStatusIndexAdded = 16
  SubmoduleStatusIndexDeleted = 32
  SubmoduleStatusIndexModified = 64
  SubmoduleStatusWdUninitialized = 128
  SubmoduleStatusWdAdded = 256
  SubmoduleStatusWdDeleted = 512
  SubmoduleStatusWdModified = 1024
  SubmoduleStatusWdIndexModified = 2048
  SubmoduleStatusWdWdModified = 4096
  SubmoduleStatusWdUntracked = 8192
  fun submodule_lookup = git_submodule_lookup(submodule : X_Submodule*, repo : X_Repository, name : LibC::Char*) : LibC::Int
  type X_Submodule = Void*
  fun submodule_foreach = git_submodule_foreach(repo : X_Repository, callback : (X_Submodule, LibC::Char*, Void* -> LibC::Int), payload : Void*) : LibC::Int
  fun submodule_add_setup = git_submodule_add_setup(submodule : X_Submodule*, repo : X_Repository, url : LibC::Char*, path : LibC::Char*, use_gitlink : LibC::Int) : LibC::Int
  fun submodule_add_finalize = git_submodule_add_finalize(submodule : X_Submodule) : LibC::Int
  fun submodule_add_to_index = git_submodule_add_to_index(submodule : X_Submodule, write_index : LibC::Int) : LibC::Int
  fun submodule_save = git_submodule_save(submodule : X_Submodule) : LibC::Int
  fun submodule_owner = git_submodule_owner(submodule : X_Submodule) : X_Repository
  fun submodule_name = git_submodule_name(submodule : X_Submodule) : LibC::Char*
  fun submodule_path = git_submodule_path(submodule : X_Submodule) : LibC::Char*
  fun submodule_url = git_submodule_url(submodule : X_Submodule) : LibC::Char*
  fun submodule_set_url = git_submodule_set_url(submodule : X_Submodule, url : LibC::Char*) : LibC::Int
  fun submodule_index_id = git_submodule_index_id(submodule : X_Submodule) : Oid*
  fun submodule_head_id = git_submodule_head_id(submodule : X_Submodule) : Oid*
  fun submodule_wd_id = git_submodule_wd_id(submodule : X_Submodule) : Oid*
  fun submodule_ignore = git_submodule_ignore(submodule : X_Submodule) : SubmoduleIgnoreT
  enum SubmoduleIgnoreT
    SubmoduleIgnoreDefault = -1
    SubmoduleIgnoreNone = 0
    SubmoduleIgnoreUntracked = 1
    SubmoduleIgnoreDirty = 2
    SubmoduleIgnoreAll = 3
  end
  fun submodule_set_ignore = git_submodule_set_ignore(submodule : X_Submodule, ignore : SubmoduleIgnoreT) : SubmoduleIgnoreT
  fun submodule_update = git_submodule_update(submodule : X_Submodule) : SubmoduleUpdateT
  enum SubmoduleUpdateT
    SubmoduleUpdateDefault = -1
    SubmoduleUpdateCheckout = 0
    SubmoduleUpdateRebase = 1
    SubmoduleUpdateMerge = 2
    SubmoduleUpdateNone = 3
  end
  fun submodule_set_update = git_submodule_set_update(submodule : X_Submodule, update : SubmoduleUpdateT) : SubmoduleUpdateT
  fun submodule_fetch_recurse_submodules = git_submodule_fetch_recurse_submodules(submodule : X_Submodule) : LibC::Int
  fun submodule_set_fetch_recurse_submodules = git_submodule_set_fetch_recurse_submodules(submodule : X_Submodule, fetch_recurse_submodules : LibC::Int) : LibC::Int
  fun submodule_init = git_submodule_init(submodule : X_Submodule, overwrite : LibC::Int) : LibC::Int
  fun submodule_sync = git_submodule_sync(submodule : X_Submodule) : LibC::Int
  fun submodule_open = git_submodule_open(repo : X_Repository*, submodule : X_Submodule) : LibC::Int
  fun submodule_reload = git_submodule_reload(submodule : X_Submodule) : LibC::Int
  fun submodule_reload_all = git_submodule_reload_all(repo : X_Repository) : LibC::Int
  fun submodule_status = git_submodule_status(status : LibC::UInt*, submodule : X_Submodule) : LibC::Int
  fun submodule_location = git_submodule_location(location_status : LibC::UInt*, submodule : X_Submodule) : LibC::Int
  alias Iterator = Void
  fun note_iterator_new = git_note_iterator_new(out : X_NoteIterator*, repo : X_Repository, notes_ref : LibC::Char*) : LibC::Int
  type X_NoteIterator = Void*
  fun note_iterator_free = git_note_iterator_free(it : X_NoteIterator)
  fun note_next = git_note_next(note_id : Oid*, annotated_id : Oid*, it : X_NoteIterator) : LibC::Int
  fun note_read = git_note_read(out : X_Note*, repo : X_Repository, notes_ref : LibC::Char*, oid : Oid*) : LibC::Int
  type X_Note = Void*
  fun note_message = git_note_message(note : X_Note) : LibC::Char*
  fun note_oid = git_note_oid(note : X_Note) : Oid*
  fun note_create = git_note_create(out : Oid*, repo : X_Repository, author : Signature*, committer : Signature*, notes_ref : LibC::Char*, oid : Oid*, note : LibC::Char*, force : LibC::Int) : LibC::Int
  fun note_remove = git_note_remove(repo : X_Repository, notes_ref : LibC::Char*, author : Signature*, committer : Signature*, oid : Oid*) : LibC::Int
  fun note_free = git_note_free(note : X_Note)
  fun note_default_ref = git_note_default_ref(out : LibC::Char**, repo : X_Repository) : LibC::Int
  fun note_foreach = git_note_foreach(repo : X_Repository, notes_ref : LibC::Char*, note_cb : NoteForeachCb, payload : Void*) : LibC::Int
  alias NoteForeachCb = (Oid*, Oid*, Void* -> LibC::Int)
  ResetSoft = 1
  ResetMixed = 2
  ResetHard = 3
  fun reset = git_reset(repo : X_Repository, target : X_Object, reset_type : ResetT) : LibC::Int
  enum ResetT
    ResetSoft = 1
    ResetMixed = 2
    ResetHard = 3
  end
  fun reset_default = git_reset_default(repo : X_Repository, target : X_Object, pathspecs : Strarray*) : LibC::Int
  fun message_prettify = git_message_prettify(out : LibC::Char*, out_size : LibC::SizeT, message : LibC::Char*, strip_comments : LibC::Int) : LibC::Int
  fun packbuilder_new = git_packbuilder_new(out : X_Packbuilder*, repo : X_Repository) : LibC::Int
  type X_Packbuilder = Void*
  fun packbuilder_set_threads = git_packbuilder_set_threads(pb : X_Packbuilder, n : LibC::UInt) : LibC::UInt
  fun packbuilder_insert = git_packbuilder_insert(pb : X_Packbuilder, id : Oid*, name : LibC::Char*) : LibC::Int
  fun packbuilder_insert_tree = git_packbuilder_insert_tree(pb : X_Packbuilder, id : Oid*) : LibC::Int
  fun packbuilder_insert_commit = git_packbuilder_insert_commit(pb : X_Packbuilder, id : Oid*) : LibC::Int
  fun packbuilder_write = git_packbuilder_write(pb : X_Packbuilder, path : LibC::Char*, progress_cb : TransferProgressCallback, progress_cb_payload : Void*) : LibC::Int
  fun packbuilder_foreach = git_packbuilder_foreach(pb : X_Packbuilder, cb : PackbuilderForeachCb, payload : Void*) : LibC::Int
  alias PackbuilderForeachCb = (Void*, LibC::SizeT, Void* -> LibC::Int)
  fun packbuilder_object_count = git_packbuilder_object_count(pb : X_Packbuilder) : Uint32T
  fun packbuilder_written = git_packbuilder_written(pb : X_Packbuilder) : Uint32T
  fun packbuilder_free = git_packbuilder_free(pb : X_Packbuilder)
  StashDefault = 0
  StashKeepIndex = 1
  StashIncludeUntracked = 2
  StashIncludeIgnored = 4
  fun stash_save = git_stash_save(out : Oid*, repo : X_Repository, stasher : Signature*, message : LibC::Char*, flags : LibC::UInt) : LibC::Int
  fun stash_foreach = git_stash_foreach(repo : X_Repository, callback : StashCb, payload : Void*) : LibC::Int
  alias StashCb = (LibC::SizeT, LibC::Char*, Oid*, Void* -> LibC::Int)
  fun stash_drop = git_stash_drop(repo : X_Repository, index : LibC::SizeT) : LibC::Int
  struct CredUserpassPayload
    username : LibC::Char*
    password : LibC::Char*
  end
  fun cred_userpass = git_cred_userpass(cred : Cred**, url : LibC::Char*, user_from_url : LibC::Char*, allowed_types : LibC::UInt, payload : Void*) : LibC::Int
  fun odb_backend_pack = git_odb_backend_pack(out : X_OdbBackend*, objects_dir : LibC::Char*) : LibC::Int
  fun odb_backend_loose = git_odb_backend_loose(out : X_OdbBackend*, objects_dir : LibC::Char*, compression_level : LibC::Int, do_fsync : LibC::Int) : LibC::Int
  fun odb_backend_one_pack = git_odb_backend_one_pack(out : X_OdbBackend*, index_file : LibC::Char*) : LibC::Int
  StreamRdonly = 2
  StreamWronly = 4
  StreamRw = 6
  fun refdb_new = git_refdb_new(out : X_Refdb*, repo : X_Repository) : LibC::Int
  fun refdb_open = git_refdb_open(out : X_Refdb*, repo : X_Repository) : LibC::Int
  fun refdb_compress = git_refdb_compress(refdb : X_Refdb) : LibC::Int
  fun refdb_free = git_refdb_free(refdb : X_Refdb)
  TraceNone = 0
  TraceFatal = 1
  TraceError = 2
  TraceWarn = 3
  TraceInfo = 4
  TraceDebug = 5
  TraceTrace = 6
  fun trace_set = git_trace_set(level : TraceLevelT, cb : TraceCallback) : LibC::Int
  enum TraceLevelT
    TraceNone = 0
    TraceFatal = 1
    TraceError = 2
    TraceWarn = 3
    TraceInfo = 4
    TraceDebug = 5
    TraceTrace = 6
  end
  alias TraceCallback = (TraceLevelT, LibC::Char* -> Void)
end
