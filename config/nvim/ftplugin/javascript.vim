" nested describe() block
inoremap <c-space>ddesc<cr> describe("++++",<space>()<space>=><space>{<cr>describe("-+-",<space>()<space>=><space>{<cr>it("-+-",<space>()<space>=><space>{<cr>-+-<cr>});<cr>});<cr>});<cr><esc>?++++<cr>:noh<cr>"_ci"

" describe() block
inoremap <c-space>desc<cr> describe("++++",<space>()<space>=><space>{<cr>it("-+-",<space>()<space>=><space>{<cr>-+-<cr>});<cr>});<cr><esc>?++++<cr>:noh<cr>"_ci"

" argument with multiline object
inoremap <c-space>f{}<cr> ({<cr>++++<cr>});<esc>?++++<cr>:noh<cr>"_c4l

" spec it() block
inoremap <c-space>it<cr> it("++++",<space>()<space>=><space>{<cr>-+-<cr>});<esc>?++++<cr>:noh<cr>ci"

" console.log( $ );
inoremap <c-space>cl<cr> console.log("++++");<esc>?++++<cr>:noh<cr>ci"

" console.log( *visual selection* );
vnoremap <c-space>cl<cr> cconsole.log("<Esc>pa");

" import
inoremap <c-space>imp<cr> import<space>++++<space>from<space>"-+-";<esc>?++++<cr>:noh<cr>"_c4l

" =>
inoremap <c-space>=><cr> (++++)<space>=><space>{<cr>-+-<cr>}<esc>?++++<cr>:noh<cr>"_c4l

" getElementById
inoremap <c-space>gid<cr> document.getElementById(++++);-+-<esc>?++++<cr>:noh<cr>"_c4l

" if/else
inoremap <c-space>ife<cr> if<space>(++++)<space>{<cr>-+-<cr>}<space>else<space>{<cr>-+-<cr>}<esc>?++++<cr>:noh<cr>"_c4l

" if
inoremap <c-space>if<cr> if<space>(++++)<space>{<cr>-+-<cr>}<esc>?++++<cr>:noh<cr>"_c4l

" standard for loop
inoremap <c-space>for<cr> for<space>(i<space>=<space>0,<space>l<space>=<space>++++.length;<space>i<space><<space>l;<space>i++)<space>{<cr>-+-<cr>}<esc>?++++<cr>:noh<cr>"_c4l

" for loop over highlighted
vnoremap <c-space>for<cr> cfor<space>(i<space>=<space>0,<space>l<space>=<space><Esc>pa.length;<space>i<space><<space>l;<space>i++)<space>{<cr>++++<cr>}<esc>?++++<cr>:noh<cr>"_c4l

" for .. in loop
inoremap <c-space>forin<cr> for<space>(++++<space>in<space>-+-)<space>{<cr>-+-<cr>}<esc>?++++<cr>:noh<cr>"_c4l

" for in over highlighted
vnoremap <c-space>forin<cr> cfor<space>(++++<space>in<space><Esc>pa)<space>{<cr>-+-<cr>}<esc>?++++<cr>:noh<cr>"_c4l

" key: value
inoremap <c-space>:<cr> ++++:<space>-+-,<space>-+-<esc>?++++<cr>:noh<cr>"_c4l

" setTimeout
inoremap <c-space>timeout<cr> ++++<space>=<space>setTimeout(()<space>=><space>{<cr>-+-<cr>},<space>-+-);<esc>?++++<cr>:noh<cr>"_c4l

" debugger
inoremap <c-space>db<cr> debugger;

" class
inoremap <c-space>class<cr> class<space>++++<space>{<cr>constructor(-+-)<space>{<cr>-+-<cr>}<cr>}<esc>?++++<cr>:noh<cr>"_c4l

" class extends
inoremap <c-space>classx<cr> class<space>++++<space>extends<space>-+-<space>{<cr>constructor(-+-)<space>{<cr>-+-<cr>}<cr>-+-<cr>}<esc>?++++<cr>:noh<cr>"_c4l

" js object with cursor on next line
inoremap <c-space>{j {<cr>++++: -+-,<cr>}-+-<esc>?++++<cr>:noh<cr>"_c4l

" array with cursor on next line
inoremap <c-space>[j [<cr>++++,<cr>]-+-<esc>?++++<cr>:noh<cr>"_c4l

" blank js object for w/in object
inoremap <c-space>{l {},

" blank array for w/in object
inoremap <c-space>[l [],

" basic named function
inoremap <c-space>fn<cr> function<space>++++(-+-)<space>{<cr>-+-<cr>}<esc>?++++<cr>:noh<cr>"_c4l

" TESTING {{{

inoremap <c-space>wrapper<cr> const<space>wrapper<space>=<space>setup(++++,<space>props);<esc>?++++<cr>:noh<cr>"_c4l

inoremap <c-space>specprops<cr> const<space>props<space>=<space>{<cr>++++<cr>};<esc>?++++<cr>:noh<cr>"_c4l

inoremap <c-space>specfunc<cr> function<space>setup(renderFn,<space>theseProps)<space>{<cr>return<space>renderFn(<++++<space>{...theseProps}<space>/>);<cr>}<esc>?++++<cr>:noh<cr>"_c4l

" }}}



" REACT {{{

" react div ready for props
inoremap <c-space>rodiv <div<cr>++++<cr>><cr>-+-<cr></div><esc>?++++<cr>:noh<cr>"_c4l

" react prop =
inoremap <c-space>r= ={<space>++++<space>}<esc>?++++<cr>:noh<cr>"_c4l

" PropTypes declaration
inoremap <c-space>pt<cr> ++++<space>:<space>PropTypes.-+-,<esc>?++++<cr>:noh<cr>"_c4l

" basic test setup
inoremap <c-space>specsetup<cr> const<space>props<space>=<space>{<cr><cr>};<cr><cr>function<space>setup(renderFn,<space>theseProps)<space>{<cr>return<space>renderFn(<lt>++++<space>{...theseProps}<space>/>);<cr>}<esc>?++++<cr>:noh<cr>"_c4l
vnoremap <c-space>specsetup. cconst<space>props<space>=<space>{<cr><cr>};<cr><cr>function<space>setup(renderFn,<space>theseProps)<space>{<cr>return<space>renderFn(<lt><Esc>pa<space>{...theseProps}<space>/>);<cr>}<esc>?++++<cr>:noh<cr>"_c4l

" basic test wrapper
inoremap <c-space>wrapper<cr> const<space>wrapper<space>=<space>setup(shallow,<space>props);<cr>

" basic render test
inoremap <c-space>rendertest<cr> it("a<space>++++",<space>()<space>=><space>{<cr>const<space>wrapper<space>=<space>setup();<cr>expect(wrapper.find("-+-").length).toBe(-+-);<cr>});<esc>?++++<cr>:noh<cr>"_c4l
vnoremap <c-space>rendertest<cr> cit("a<space><Esc>pa",<space>()<space>=><space>{<cr>const<space>wrapper<space>=<space>setup();<cr>expect(wrapper.find("<Esc>pa").length).toBe(-+-);<cr>});

" }}}
