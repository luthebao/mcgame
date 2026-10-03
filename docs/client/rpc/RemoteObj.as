// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.rpc.RemoteObj

package com.qeedoo.game.rpc
{
    import flash.utils.Proxy;
    import flash.net.NetConnection;
    import flash.events.NetStatusEvent;
    import flash.net.ObjectEncoding;
    import com.qeedoo.game.config.RPCConfig;
    import flash.net.Responder;
    import flash.utils.flash_proxy; 

    use namespace flash.utils.flash_proxy;

    public dynamic class RemoteObj extends Proxy 
    {

        public static var CHECK_DELAY:Number = 1000;
        public static var MAX_CALL:Number = 100;
        public static var MIN_DELAY:Number = 100;

        private var _lastCode:String;
        private var _lastStatus:String;
        private var _callNum:Object;
        private var _nc:NetConnection;
        private var _callTotal:Object;
        public var kickCode:String;
        public var showAlert:Boolean;
        private var _cInfo:Array;
        private var _lastCall:Object;

        public function RemoteObj(_arg_1:Object)
        {
            _nc = new NetConnection();
            _nc.addEventListener(NetStatusEvent.NET_STATUS, nsHandler);
            _nc.objectEncoding = ObjectEncoding.AMF0;
            _nc.client = _arg_1;
            showAlert = true;
            _callNum = {};
            _lastCall = {};
            _callTotal = {};
        }

        private function nsHandler(_arg_1:NetStatusEvent):void
        {
            _lastStatus = _arg_1.info.code;
            _lastCode = _arg_1.info.application;
            switch (_lastStatus)
            {
                case "NetConnection.Connect.Closed":
                    _nc.client.close();
                    return;
                case "NetConnection.Connect.Rejected":
                    if (((_arg_1.info) && (_arg_1.info.application == "ERR_CLASSIFY")))
                    {
                        _nc.client.classifyAlert();
                    };
                    if (((_arg_1.info) && (_arg_1.info.application == "ERR_CLASSIFY2")))
                    {
                        _nc.client.classifyAlert2();
                    };
                    if (((_arg_1.info) && (_arg_1.info.application == "ERR_CLASSIFY3")))
                    {
                        _nc.client.classifyAlert3();
                    };
                    if (((_arg_1.info) && (_arg_1.info.application == "ERR_CLASSIFY4")))
                    {
                        _nc.client.classifyAlert4();
                    };
                    if (((_arg_1.info) && (_arg_1.info.application == "ERR_CLASSIFY5")))
                    {
                        _nc.client.classifyAlert5();
                    };
                    if (((_arg_1.info) && (_arg_1.info.application == "ERR_CLASSIFY6")))
                    {
                        _nc.client.classifyAlert6();
                    };
                    if (((_arg_1.info) && (_arg_1.info.application == "ERR_CLASSIFY7")))
                    {
                        _nc.client.classifyAlert7();
                    };
                    return;
            };
        }

        override flash_proxy function callProperty(_arg_1:*, ... _args):*
        {
            var _local_3:Number = new Date().getTime();
            if (RPCConfig.RPC_DELAY[_arg_1])
            {
                if ((((!(_lastCall[_arg_1] is Number)) || ((_local_3 - _lastCall[_arg_1]) > RPCConfig.RPC_DELAY[_arg_1])) || ((RPCConfig.RPC_DENY_MAX[_arg_1]) && (_callNum[_arg_1] >= RPCConfig.RPC_DENY_MAX[_arg_1]))))
                {
                    _lastCall[_arg_1] = _local_3;
                    _callNum[_arg_1] = 0;
                }
                else
                {
                    _callNum[_arg_1] = (Number(_callNum[_arg_1]) + 1);
                    return;
                };
            };
            if (_args.length > 0)
            {
                _args.unshift(_arg_1.toString(), null);
                _nc.call.apply(_nc, _args);
            }
            else
            {
                _nc.call(_arg_1.toString(), null);
            };
            return (null);
        }

        public function call(_arg_1:String, _arg_2:Responder, ... _args):Boolean
        {
            var _local_4:Number = new Date().getTime();
            if (RPCConfig.RPC_DELAY[_arg_1])
            {
                if ((((!(_lastCall[_arg_1] is Number)) || ((_local_4 - _lastCall[_arg_1]) > RPCConfig.RPC_DELAY[_arg_1])) || ((RPCConfig.RPC_DENY_MAX[_arg_1]) && (_callNum[_arg_1] >= RPCConfig.RPC_DENY_MAX[_arg_1]))))
                {
                    _lastCall[_arg_1] = _local_4;
                    _callNum[_arg_1] = 0;
                }
                else
                {
                    _callNum[_arg_1] = (Number(_callNum[_arg_1]) + 1);
                    return (false);
                };
            };
            _args.unshift(_arg_2);
            _args.unshift(_arg_1);
            _nc.call.apply(_nc, _args);
            return (true);
        }

        public function connect(... _args):void
        {
            _nc.connect.apply(_nc, _args);
        }

        public function get info():String
        {
            return (_lastStatus);
        }

        public function set nc(_arg_1:NetConnection):void
        {
            _nc.removeEventListener(NetStatusEvent.NET_STATUS, nsHandler);
            this._nc = _arg_1;
            _nc.addEventListener(NetStatusEvent.NET_STATUS, nsHandler);
        }

        public function get nc():NetConnection
        {
            return (_nc);
        }

        private function reConnect():void
        {
            close();
            _nc.connect.apply(_nc, _cInfo);
        }

        public function close():void
        {
            var _local_1:Boolean = showAlert;
            showAlert = false;
            _nc.close();
            showAlert = _local_1;
        }

        public function get appCode():String
        {
            return (_lastCode);
        }


    }
}//package com.qeedoo.game.rpc

