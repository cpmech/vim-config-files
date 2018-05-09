if exists("b:did_my_js_ftplugin")
	finish
endif
let b:did_my_js_ftplugin = 1

set tabstop=2
set shiftwidth=2

call IMAP ("TFOR","for (let <++> = <++>; <++>; <++>++) {\<cr><++>\<cr>}","javascript")
call IMAP ("TFOI","for (let i = <++>; i < <++>; i++) {\<cr><++>\<cr>}","javascript")
call IMAP ("TFOJ","for (let j = <++>; j < <++>; j++) {\<cr><++>\<cr>}","javascript")
call IMAP ("TFOK","for (let k = <++>; k < <++>; k++) {\<cr><++>\<cr>}","javascript")
call IMAP ("TLOG","console.log(<++>);","javascript")
call IMAP ("TFOX","for (let key of <++>.keys()) {\<cr><++>\<cr>}","javascript")
call IMAP ("TFOY","for (let value of <++>.values()) {\<cr><++>\<cr>}","javascript")
call IMAP ("TFOZ","for (let [key, value] of <++>.entries()) {\<cr><++>\<cr>}","javascript")
call IMAP ("TCOPY","// Copyright 2018 Janett Advisory Intel Inc. All rights reserved.\<cr>", "javascript")

" template-react-component-class
call IMAP ("TRCC","import React from 'react';\<cr>\<cr>type IProps = {\<cr>propsData: number,\<cr>};\<cr>\<cr>type IState = {\<cr>stateData: number,\<cr>};\<cr>\<cr>class <++> extends React.Component<IProps, IState> {\<cr>state: {\<cr>stateData: 0,\<cr>};\<cr>\<cr>render() {\<cr>const { propsData } = this.props;\<cr>const { stateData } = this.state;\<cr>return (\<cr><div>\<cr><p>Props {propsData}</p>\<cr><p>State {stateData}</p>\<cr></div>\<cr>);\<cr>}\<cr>}\<cr>\<cr>export default <++>;", "javascript")

" template-react-component-functional
call IMAP ("TRCF", "import React from 'react';\<cr>\<cr>type IProps = {\<cr>data: number,\<cr>};\<cr>\<cr>const <++> = (props: IProps) => {\<cr>const { data } = props;\<cr>return (\<cr><div>\<cr><p>Data</p>\<cr><p>{data}</p>\<cr></div>\<cr>);\<cr>};\<cr>\<cr>export default <++>;", "javascript")
