if exists("b:did_my_js_ftplugin")
	finish
endif
let b:did_my_js_ftplugin = 1

set tabstop=4
set shiftwidth=4

call IMAP ("TFOR","for (let <++> = <++>; <++>; <++>++) {\<cr><++>\<cr>}","javascript")
call IMAP ("TFOI","for (let i = <++>; i < <++>; i++) {\<cr><++>\<cr>}","javascript")
call IMAP ("TFOJ","for (let j = <++>; j < <++>; j++) {\<cr><++>\<cr>}","javascript")
call IMAP ("TFOK","for (let k = <++>; k < <++>; k++) {\<cr><++>\<cr>}","javascript")
call IMAP ("TLOG","console.log(<++>);","javascript")
call IMAP ("TFOX","for (let key of <++>.keys()) {\<cr><++>\<cr>}","javascript")
call IMAP ("TFOY","for (let value of <++>.values()) {\<cr><++>\<cr>}","javascript")
call IMAP ("TFOZ","for (let [key, value] of <++>.entries()) {\<cr><++>\<cr>}","javascript")

" react
call IMAP ("TRCLASS","type PropsType = {\<cr>};\<cr>\<cr>type StateType = {\<cr>};\<cr>\<cr>export default class <++> extends React.Component<void, PropsType, StateType> {\<cr>\<cr>state: StateType;\<cr>\<cr>render(): React.Element<any> {\<cr>return (\<cr><div>\<cr>    <++>\<cr></div>\<cr>);\<cr>}\<cr>}", "javascript")

call IMAP ("TRCOMP", "import React from 'react';\<cr>\<cr>import { store } from '../store';\<cr>\<cr>type PropsType = {\<cr>};\<cr>\<cr>const <++> = (props: PropsType): React.Element<any> => {\<cr>let { <++> } = props;\<cr>return (\<cr><div>\<cr></div>\<cr>);\<cr>};\<cr>\<cr>export default <++>;", "javascript")
