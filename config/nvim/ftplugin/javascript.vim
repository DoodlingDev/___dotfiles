" nested describe() block
inoremap &ddesc. describe("++++",<space>()<space>=><space>{<cr>describe("-+-",<space>()<space>=><space>{<cr>it("-+-",<space>()<space>=><space>{<cr>-+-<cr>});<cr>});<cr>});<cr><esc>?++++<cr>:noh<cr>ci"

" describe() block
inoremap &desc. describe("++++",<space>()<space>=><space>{<cr>it("-+-",<space>()<space>=><space>{<cr>-+-<cr>});<cr>});<cr><esc>?++++<cr>:noh<cr>ci"

" argument with multiline object
inoremap &f{}. ({<cr>++++<cr>});<esc>?++++<cr>:noh<cr>"_c4l

" spec it() block
inoremap &it. it("++++",<space>()<space>=><space>{<cr>-+-<cr>});<esc>?++++<cr>:noh<cr>ci"

" console.log( $ );
inoremap &cl. console.log("++++");<esc>?++++<cr>:noh<cr>ci"

" console.log( *visual selection* );
vnoremap &cl. cconsole.log("<Esc>pa");

" import
inoremap &imp. import<space>++++<space>from<space>"-+-";<esc>?++++<cr>:noh<cr>c4l

" =>
inoremap &=>. (++++)<space>=><space>{<cr>-+-<cr>}<esc>?++++<cr>:noh<cr>c4l

" getElementById
inoremap &gid. document.getElementById(++++);-+-<esc>?++++<cr>:noh<cr>c4l

" if/else
inoremap &ife. if<space>(++++)<space>{<cr>-+-<cr>}<space>else<space>{<cr>-+-<cr>}<esc>?++++<cr>:noh<cr>c4l

" if
inoremap &if. if<space>(++++)<space>{<cr>-+-<cr>}<esc>?++++<cr>:noh<cr>c4l

" standard for loop
inoremap &for. for<space>(i<space>=<space>0,<space>l<space>=<space>++++.length;<space>i<space><<space>l;<space>i++)<space>{<cr>-+-<cr>}<esc>?++++<cr>:noh<cr>c4l

" for loop over highlighted
vnoremap &for. cfor<space>(i<space>=<space>0,<space>l<space>=<space><Esc>pa.length;<space>i<space><<space>l;<space>i++)<space>{<cr>++++<cr>}<esc>?++++<cr>:noh<cr>c4l

" for .. in loop
inoremap &forin. for<space>(++++<space>in<space>-+-)<space>{<cr>-+-<cr>}<esc>?++++<cr>:noh<cr>c4l

" for in over highlighted
vnoremap &forin. cfor<space>(++++<space>in<space><Esc>pa)<space>{<cr>-+-<cr>}<esc>?++++<cr>:noh<cr>c4l

" key: value
inoremap &:. ++++:<space>-+-,<space>-+-<esc>?++++<cr>:noh<cr>c4l

" setTimeout
inoremap &timeout. ++++<space>=<space>setTimeout(()<space>=><space>{<cr>-+-<cr>},<space>-+-);<esc>?++++<cr>:noh<cr>c4l

" debugger
inoremap &db. debugger;

" class
inoremap &class. class<space>++++<space>{<cr>constructor(-+-)<space>{<cr>-+-<cr>}<cr>}<esc>?++++<cr>:noh<cr>c4l

" class extends
inoremap &classx. class<space>++++<space>extends<space>-+-<space>{<cr>constructor(-+-)<space>{<cr>-+-<cr>}<cr>-+-<cr>}<esc>?++++<cr>:noh<cr>c4l

" js object with cursor on next line
inoremap &{j {<cr>++++: -+-,<cr>}-+-<esc>?++++<cr>:noh<cr>c4l

" array with cursor on next line
inoremap &[j [<cr>++++,<cr>]-+-<esc>?++++<cr>:noh<cr>c4l

" blank js object for w/in object
inoremap &{l {},

" blank array for w/in object
inoremap &[l [],

" TESTING {{{

inoremap &wrapper. const<space>wrapper<space>=<space>setup(++++,<space>props);<esc>?++++<cr>:noh<cr>c4l

inoremap &specprops. const<space>props<space>=<space>{<cr>++++<cr>};<esc>?++++<cr>:noh<cr>c4l

inoremap &specfunc. function<space>setup(renderFn,<space>theseProps)<space>{<cr>return<space>renderFn(<++++<space>{...theseProps}<space>/>);<cr>}<esc>?++++<cr>:noh<cr>c4l

" }}}



" REACT {{{

" react div ready for props
inoremap &rodiv <div<cr>++++<cr>><cr>-+-<cr></div><esc>?++++<cr>:noh<cr>c4l

" react prop =
inoremap &r= ={<space>++++<space>}<esc>?++++<cr>:noh<cr>c4l

" PropTypes declaration
inoremap &pt. ++++<space>:<space>PropTypes.-+-,<esc>?++++<cr>:noh<cr>c4l

" basic test setup
inoremap &specsetup. const<space>props<space>=<space>{<cr><cr>};<cr><cr>function<space>setup(renderFn,<space>theseProps)<space>{<cr>return<space>renderFn(<lt>++++<space>{...theseProps}<space>/>);<cr>}<esc>?++++<cr>:noh<cr>c4l
vnoremap &specsetup. cconst<space>props<space>=<space>{<cr><cr>};<cr><cr>function<space>setup(renderFn,<space>theseProps)<space>{<cr>return<space>renderFn(<lt><Esc>pa<space>{...theseProps}<space>/>);<cr>}<esc>?++++<cr>:noh<cr>c4l

" basic test wrapper
inoremap &wrapper. const<space>wrapper<space>=<space>setup(shallow,<space>props);<cr>

" basic render test
inoremap &rendertest. it("a<space>++++",<space>()<space>=><space>{<cr>const<space>wrapper<space>=<space>setup();<cr>expect(wrapper.find("-+-").length).toBe(-+-);<cr>});<esc>?++++<cr>:noh<cr>c4l
vnoremap &rendertest. cit("a<space><Esc>pa",<space>()<space>=><space>{<cr>const<space>wrapper<space>=<space>setup();<cr>expect(wrapper.find("<Esc>pa").length).toBe(-+-);<cr>});

" }}}
