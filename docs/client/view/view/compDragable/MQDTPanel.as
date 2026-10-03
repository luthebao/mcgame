// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MQDTPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import flash.utils.Timer;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.controls.LinkButton;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import mx.events.FlexEvent;
    import flash.net.Responder;
    import flash.events.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.text.*;
    import flash.media.*;
    import mx.binding.*;
    import flash.net.*;
    import flash.utils.*;
    import flash.system.*;
    import flash.accessibility.*;
    import flash.ui.*;
    import flash.filters.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    use namespace mx_internal;

    public class MQDTPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _332375386moneyNum:int = 0;
        public var _MQDTPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var ansTimer:Timer;
        private var answerData:Object;
        private var _1263205542lb_process:BasicTxtButton;
        private var leader_cid:int;
        private var _110364486times:int = 0;
        private var _321971910answerTitle:IntroText;
        private var firstTimeFlag:Boolean = true;
        private var _3526471sela:LinkButton;
        private var _315724349isfinish:BasicTxtButton;
        private var _3526474seld:LinkButton;
        private var _3526473selc:LinkButton;
        private var _3526472selb:LinkButton;
        private var _402398819completeBtn:BasicDelayButton;
        private var _1118843173lb_status:BasicTxtButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":295,
                    "height":376,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_MQDTPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":IntroText,
                        "id":"answerTitle",
                        "events":{"mouseDown":"__answerTitle_mouseDown"},
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.right = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":40,
                                "height":90
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.right = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":140,
                                "height":125,
                                "styleName":"RoundedGradientBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"sela",
                                    "events":{"click":"__sela_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":14});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"selb",
                                    "events":{"click":"__selb_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":42});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"selc",
                                    "events":{"click":"__selc_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":70});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"seld",
                                    "events":{"click":"__seld_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":98});
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"lb_process",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 0;
                            this.paddingRight = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":8,
                                "y":300,
                                "width":105,
                                "height":19,
                                "label":"0/10"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"lb_status",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 0;
                            this.paddingRight = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":40,
                                "y":300,
                                "width":105,
                                "height":19,
                                "label":""
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"isfinish",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 0;
                            this.paddingRight = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":8,
                                "y":320,
                                "height":19
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicDelayButton,
                        "id":"completeBtn",
                        "events":{"click":"__completeBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "clickDelay":30000,
                                "styleName":"BtnStdGreen",
                                "x":8,
                                "y":340,
                                "visible":false
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _qObj:Object = {};
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MQDTPanel()
        {
            mx_internal::_document = this;
            this.width = 295;
            this.height = 376;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MQDTPanel._watcherSetupUtil = _arg_1;
        }


        public function updateMQDTQuestion(_arg_1:Object):void
        {
            leader_cid = _arg_1.leader_cid;
            var _local_2:* = _arg_1.qList[_arg_1.process[_core.cid]];
            _qObj = GameData.d[GamePredef.TBL_ANSWER][_local_2];
            if (_qObj)
            {
                answerTitle.text = _qObj.t;
                sela.label = _qObj.a;
                selb.label = _qObj.b;
                selc.label = _qObj.c;
                seld.label = _qObj.d;
                answerTitle.visible = true;
                sela.visible = true;
                selb.visible = true;
                selc.visible = true;
                seld.visible = true;
            };
        }

        public function __selc_click(_arg_1:MouseEvent):void
        {
            answerMQDT("C");
        }

        private function set times(_arg_1:int):void
        {
            var _local_2:Object = this._110364486times;
            if (_local_2 !== _arg_1)
            {
                this._110364486times = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "times", _local_2, _arg_1));
            };
        }

        public function set selc(_arg_1:LinkButton):void
        {
            var _local_2:Object = this._3526473selc;
            if (_local_2 !== _arg_1)
            {
                this._3526473selc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selc", _local_2, _arg_1));
            };
        }

        public function set sela(_arg_1:LinkButton):void
        {
            var _local_2:Object = this._3526471sela;
            if (_local_2 !== _arg_1)
            {
                this._3526471sela = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sela", _local_2, _arg_1));
            };
        }

        private function _MQDTPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANSWERPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MQDTPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_MQDTPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MQDT_PANEL[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                isfinish.label = _arg_1;
            }, "isfinish.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MQDT_PANEL[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                completeBtn.label = _arg_1;
            }, "completeBtn.label");
            result[2] = binding;
            return (result);
        }

        override public function initialize():void
        {
            var target:MQDTPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MQDTPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MQDTPanelWatcherSetupUtil");
                var _local_2:* = watcherSetupUtilClass;
                (_local_2["init"](null));
            };
            _watcherSetupUtil.setup(this, function (_arg_1:String):*
            {
                return (target[_arg_1]);
            }, bindings, watchers);
            var i:uint;
            while (i < bindings.length)
            {
                Binding(bindings[i]).execute();
                i++;
            };
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            super.initialize();
        }

        public function set seld(_arg_1:LinkButton):void
        {
            var _local_2:Object = this._3526474seld;
            if (_local_2 !== _arg_1)
            {
                this._3526474seld = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "seld", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lb_process():BasicTxtButton
        {
            return (this._1263205542lb_process);
        }

        private function viewClear():void
        {
            answerTitle.visible = false;
            sela.visible = false;
            selb.visible = false;
            selc.visible = false;
            seld.visible = false;
        }

        [Bindable(event="propertyChange")]
        private function get moneyNum():int
        {
            return (this._332375386moneyNum);
        }

        private function onAnswerMQDT(_arg_1:Object):void
        {
            var _local_2:* = _arg_1.process[_core.cid];
            if (_local_2 >= 10)
            {
                viewClear();
                if (leader_cid == _core.cid)
                {
                    completeBtn.visible = true;
                }
                else
                {
                    hide();
                    Alert.show(Language.MQDT_PANEL[0]);
                };
            };
            lb_process.label = (_local_2 + "/10 ");
            var _local_3:* = _arg_1.isCorrect;
            if (_local_3)
            {
                lb_status.label = Language.MQDT_PANEL[1];
            }
            else
            {
                lb_status.label = Language.MQDT_PANEL[2];
            };
            updateMQDTQuestion(_arg_1);
        }

        public function __selb_click(_arg_1:MouseEvent):void
        {
            answerMQDT("B");
        }

        private function complete():void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    hide();
                    _core.remote.call("completeMQDT", null, leader_cid);
                };
            };
            Alert.show(Language.MQDT_PANEL[3], "", (Alert.YES | Alert.NO), null, func);
        }

        public function __seld_click(_arg_1:MouseEvent):void
        {
            answerMQDT("D");
        }

        [Bindable(event="propertyChange")]
        public function get isfinish():BasicTxtButton
        {
            return (this._315724349isfinish);
        }

        public function __answerTitle_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function set lb_status(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1118843173lb_status;
            if (_local_2 !== _arg_1)
            {
                this._1118843173lb_status = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_status", _local_2, _arg_1));
            };
        }

        public function set completeBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._402398819completeBtn;
            if (_local_2 !== _arg_1)
            {
                this._402398819completeBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "completeBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get sela():LinkButton
        {
            return (this._3526471sela);
        }

        [Bindable(event="propertyChange")]
        public function get selb():LinkButton
        {
            return (this._3526472selb);
        }

        [Bindable(event="propertyChange")]
        public function get answerTitle():IntroText
        {
            return (this._321971910answerTitle);
        }

        public function __completeBtn_click(_arg_1:MouseEvent):void
        {
            complete();
        }

        [Bindable(event="propertyChange")]
        private function get times():int
        {
            return (this._110364486times);
        }

        [Bindable(event="propertyChange")]
        public function get selc():LinkButton
        {
            return (this._3526473selc);
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
        }

        public function set selb(_arg_1:LinkButton):void
        {
            var _local_2:Object = this._3526472selb;
            if (_local_2 !== _arg_1)
            {
                this._3526472selb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selb", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get seld():LinkButton
        {
            return (this._3526474seld);
        }

        public function set lb_process(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1263205542lb_process;
            if (_local_2 !== _arg_1)
            {
                this._1263205542lb_process = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_process", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lb_status():BasicTxtButton
        {
            return (this._1118843173lb_status);
        }

        [Bindable(event="propertyChange")]
        public function get completeBtn():BasicDelayButton
        {
            return (this._402398819completeBtn);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (((_arg_1) && (firstTimeFlag)))
            {
                initView();
                firstTimeFlag = false;
            };
        }

        private function _MQDTPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.ANSWERPANEL_U[1];
            _local_1 = Language.MQDT_PANEL[4];
            _local_1 = Language.MQDT_PANEL[5];
        }

        private function set moneyNum(_arg_1:int):void
        {
            var _local_2:Object = this._332375386moneyNum;
            if (_local_2 !== _arg_1)
            {
                this._332375386moneyNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moneyNum", _local_2, _arg_1));
            };
        }

        public function __sela_click(_arg_1:MouseEvent):void
        {
            answerMQDT("A");
        }

        public function set answerTitle(_arg_1:IntroText):void
        {
            var _local_2:Object = this._321971910answerTitle;
            if (_local_2 !== _arg_1)
            {
                this._321971910answerTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "answerTitle", _local_2, _arg_1));
            };
        }

        public function resetPanel():void
        {
            lb_process.label = "0/10";
            lb_status.label = "";
            completeBtn.visible = false;
        }

        private function answerMQDT(_arg_1:String):void
        {
            _core.remote.call("answerMQDT", new Responder(onAnswerMQDT), leader_cid, _core.cid, _arg_1);
        }

        public function set isfinish(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._315724349isfinish;
            if (_local_2 !== _arg_1)
            {
                this._315724349isfinish = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "isfinish", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

