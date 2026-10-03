// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.SignInPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.controls.Label;
    import mx.controls.Button;
    import mx.containers.Canvas;
    import mx.controls.Text;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.FlexEvent;
    import flash.net.Responder;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
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

    public class SignInPanel extends DragableCanvas implements IBindingClient 
    {

        public static const ACTIVE_ICON:Class = SignInPanel_ACTIVE_ICON;
        public static const QianDaoKaPai:Class = SignInPanel_QianDaoKaPai;
        public static const QianDaoKaPai1:Class = SignInPanel_QianDaoKaPai1;
        public static const YiQianDao:Class = SignInPanel_YiQianDao;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1934594272imgBackGround1:Image;
        private var _24325233imgSignin4:Image;
        private var _1934594276imgBackGround5:Image;
        public var _SignInPanel_Label2:Label;
        public var _SignInPanel_Label3:Label;
        public var _SignInPanel_Label4:Label;
        public var _SignInPanel_Label5:Label;
        public var _SignInPanel_Label6:Label;
        private var _1934594273imgBackGround2:Image;
        private var _24325236imgSignin1:Image;
        private var _24325232imgSignin5:Image;
        private var _2088273107signin5:Button;
        private var _1934594274imgBackGround3:Image;
        private var _2088273106signin4:Button;
        public var _SignInPanel_Image1:Image;
        private var _24325235imgSignin2:Image;
        private var _1020731910myLevel2:Label;
        private var _873453350title2:Canvas;
        private var _2088273105signin3:Button;
        public var _SignInPanel_Text1:Text;
        private var _1934594275imgBackGround4:Image;
        public var _SignInPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _24325234imgSignin3:Image;
        private var _2088273103signin1:Button;
        private var _2088273104signin2:Button;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":560,
                    "height":444,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_SignInPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.top = "40";
                            this.bottom = "10";
                            this.left = "10";
                            this.right = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "label":"",
                                "percentWidth":100,
                                "percentHeight":100,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                        this.right = "10";
                                        this.top = "10";
                                        this.bottom = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_SignInPanel_Image1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":5,
                                                        "width":500,
                                                        "height":75
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"title2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "x":10,
                                                        "y":85,
                                                        "width":500,
                                                        "height":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Text,
                                                            "id":"_SignInPanel_Text1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "10";
                                                                this.top = "10";
                                                                this.fontSize = 14;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"height":80});
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"myLevel2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":150,
                                                        "width":410,
                                                        "height":30,
                                                        "text":""
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imgBackGround1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":50,
                                                        "y":210
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_SignInPanel_Label2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":70,
                                                        "y":220,
                                                        "width":80,
                                                        "height":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imgSignin1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "visible":false,
                                                        "x":40,
                                                        "y":210
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"signin1",
                                                "events":{"click":"__signin1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":62,
                                                        "y":313,
                                                        "styleName":"BtnStdRed",
                                                        "enabled":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imgBackGround2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":135,
                                                        "y":210
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_SignInPanel_Label3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":155,
                                                        "y":220,
                                                        "width":80,
                                                        "height":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imgSignin2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "visible":false,
                                                        "x":125,
                                                        "y":210
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"signin2",
                                                "events":{"click":"__signin2_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":147,
                                                        "y":313,
                                                        "styleName":"BtnStdRed",
                                                        "enabled":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imgBackGround3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":220,
                                                        "y":210
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_SignInPanel_Label4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":240,
                                                        "y":220,
                                                        "width":80,
                                                        "height":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imgSignin3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "visible":false,
                                                        "x":210,
                                                        "y":210
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"signin3",
                                                "events":{"click":"__signin3_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":232,
                                                        "y":313,
                                                        "styleName":"BtnStdRed",
                                                        "enabled":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imgBackGround4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":305,
                                                        "y":210
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_SignInPanel_Label5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":325,
                                                        "y":220,
                                                        "width":80,
                                                        "height":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imgSignin4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "visible":false,
                                                        "x":295,
                                                        "y":210
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"signin4",
                                                "events":{"click":"__signin4_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":315,
                                                        "y":313,
                                                        "styleName":"BtnStdRed",
                                                        "enabled":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imgBackGround5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":390,
                                                        "y":210
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_SignInPanel_Label6",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":410,
                                                        "y":220,
                                                        "width":80,
                                                        "height":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imgSignin5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "visible":false,
                                                        "x":380,
                                                        "y":210
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"signin5",
                                                "events":{"click":"__signin5_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":402,
                                                        "y":313,
                                                        "styleName":"BtnStdRed",
                                                        "enabled":false
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function SignInPanel()
        {
            mx_internal::_document = this;
            this.width = 560;
            this.height = 444;
            this.styleName = "StandardContent";
            this.x = 135;
            this.y = 258;
            this.addEventListener("creationComplete", ___SignInPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SignInPanel._watcherSetupUtil = _arg_1;
        }


        public function ___SignInPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function init():void
        {
            _core.remote.call("getSignInData", new Responder(onGetSignInData), null);
        }

        public function set imgSignin1(_arg_1:Image):void
        {
            var _local_2:Object = this._24325236imgSignin1;
            if (_local_2 !== _arg_1)
            {
                this._24325236imgSignin1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgSignin1", _local_2, _arg_1));
            };
        }

        public function set imgSignin5(_arg_1:Image):void
        {
            var _local_2:Object = this._24325232imgSignin5;
            if (_local_2 !== _arg_1)
            {
                this._24325232imgSignin5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgSignin5", _local_2, _arg_1));
            };
        }

        public function set imgSignin3(_arg_1:Image):void
        {
            var _local_2:Object = this._24325234imgSignin3;
            if (_local_2 !== _arg_1)
            {
                this._24325234imgSignin3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgSignin3", _local_2, _arg_1));
            };
        }

        public function set imgSignin4(_arg_1:Image):void
        {
            var _local_2:Object = this._24325233imgSignin4;
            if (_local_2 !== _arg_1)
            {
                this._24325233imgSignin4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgSignin4", _local_2, _arg_1));
            };
        }

        public function set imgSignin2(_arg_1:Image):void
        {
            var _local_2:Object = this._24325235imgSignin2;
            if (_local_2 !== _arg_1)
            {
                this._24325235imgSignin2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgSignin2", _local_2, _arg_1));
            };
        }

        public function __signin1_click(_arg_1:MouseEvent):void
        {
            signin();
        }

        public function __signin5_click(_arg_1:MouseEvent):void
        {
            signin();
        }

        public function __signin2_click(_arg_1:MouseEvent):void
        {
            signin();
        }

        [Bindable(event="propertyChange")]
        public function get imgSignin2():Image
        {
            return (this._24325235imgSignin2);
        }

        [Bindable(event="propertyChange")]
        public function get imgSignin4():Image
        {
            return (this._24325233imgSignin4);
        }

        [Bindable(event="propertyChange")]
        public function get imgSignin5():Image
        {
            return (this._24325232imgSignin5);
        }

        [Bindable(event="propertyChange")]
        public function get imgSignin3():Image
        {
            return (this._24325234imgSignin3);
        }

        [Bindable(event="propertyChange")]
        public function get imgSignin1():Image
        {
            return (this._24325236imgSignin1);
        }

        public function set signin1(_arg_1:Button):void
        {
            var _local_2:Object = this._2088273103signin1;
            if (_local_2 !== _arg_1)
            {
                this._2088273103signin1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "signin1", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:SignInPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SignInPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_SignInPanelWatcherSetupUtil");
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

        public function set signin2(_arg_1:Button):void
        {
            var _local_2:Object = this._2088273104signin2;
            if (_local_2 !== _arg_1)
            {
                this._2088273104signin2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "signin2", _local_2, _arg_1));
            };
        }

        public function signin():void
        {
            _core.remote.call("signinNow", new Responder(onGetSignInData), null);
        }

        public function set signin4(_arg_1:Button):void
        {
            var _local_2:Object = this._2088273106signin4;
            if (_local_2 !== _arg_1)
            {
                this._2088273106signin4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "signin4", _local_2, _arg_1));
            };
        }

        public function set signin3(_arg_1:Button):void
        {
            var _local_2:Object = this._2088273105signin3;
            if (_local_2 !== _arg_1)
            {
                this._2088273105signin3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "signin3", _local_2, _arg_1));
            };
        }

        public function set signin5(_arg_1:Button):void
        {
            var _local_2:Object = this._2088273107signin5;
            if (_local_2 !== _arg_1)
            {
                this._2088273107signin5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "signin5", _local_2, _arg_1));
            };
        }

        public function set title2(_arg_1:Canvas):void
        {
            var _local_2:Object = this._873453350title2;
            if (_local_2 !== _arg_1)
            {
                this._873453350title2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title2", _local_2, _arg_1));
            };
        }

        public function set imgBackGround1(_arg_1:Image):void
        {
            var _local_2:Object = this._1934594272imgBackGround1;
            if (_local_2 !== _arg_1)
            {
                this._1934594272imgBackGround1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgBackGround1", _local_2, _arg_1));
            };
        }

        public function __signin3_click(_arg_1:MouseEvent):void
        {
            signin();
        }

        public function set imgBackGround2(_arg_1:Image):void
        {
            var _local_2:Object = this._1934594273imgBackGround2;
            if (_local_2 !== _arg_1)
            {
                this._1934594273imgBackGround2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgBackGround2", _local_2, _arg_1));
            };
        }

        public function set imgBackGround3(_arg_1:Image):void
        {
            var _local_2:Object = this._1934594274imgBackGround3;
            if (_local_2 !== _arg_1)
            {
                this._1934594274imgBackGround3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgBackGround3", _local_2, _arg_1));
            };
        }

        public function set imgBackGround4(_arg_1:Image):void
        {
            var _local_2:Object = this._1934594275imgBackGround4;
            if (_local_2 !== _arg_1)
            {
                this._1934594275imgBackGround4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgBackGround4", _local_2, _arg_1));
            };
        }

        public function set imgBackGround5(_arg_1:Image):void
        {
            var _local_2:Object = this._1934594276imgBackGround5;
            if (_local_2 !== _arg_1)
            {
                this._1934594276imgBackGround5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgBackGround5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get signin2():Button
        {
            return (this._2088273104signin2);
        }

        [Bindable(event="propertyChange")]
        public function get signin3():Button
        {
            return (this._2088273105signin3);
        }

        [Bindable(event="propertyChange")]
        public function get signin4():Button
        {
            return (this._2088273106signin4);
        }

        private function _SignInPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SERVERACTPANEL_S[37];
            _local_1 = ACTIVE_ICON;
            _local_1 = Language.SIGN_IN_U[0];
            _local_1 = QianDaoKaPai1;
            _local_1 = Language.SIGN_IN_U[1];
            _local_1 = Language.SIGN_IN_U[6];
            _local_1 = YiQianDao;
            _local_1 = Language.SIGN_IN_U[11];
            _local_1 = QianDaoKaPai1;
            _local_1 = Language.SIGN_IN_U[2];
            _local_1 = Language.SIGN_IN_U[7];
            _local_1 = YiQianDao;
            _local_1 = Language.SIGN_IN_U[11];
            _local_1 = QianDaoKaPai1;
            _local_1 = Language.SIGN_IN_U[3];
            _local_1 = Language.SIGN_IN_U[8];
            _local_1 = YiQianDao;
            _local_1 = Language.SIGN_IN_U[11];
            _local_1 = QianDaoKaPai1;
            _local_1 = Language.SIGN_IN_U[4];
            _local_1 = Language.SIGN_IN_U[9];
            _local_1 = YiQianDao;
            _local_1 = Language.SIGN_IN_U[11];
            _local_1 = QianDaoKaPai1;
            _local_1 = Language.SIGN_IN_U[5];
            _local_1 = Language.SIGN_IN_U[10];
            _local_1 = YiQianDao;
            _local_1 = Language.SIGN_IN_U[11];
        }

        [Bindable(event="propertyChange")]
        public function get signin1():Button
        {
            return (this._2088273103signin1);
        }

        private function _SignInPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SignInPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_SignInPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ACTIVE_ICON);
            }, function (_arg_1:Object):void
            {
                _SignInPanel_Image1.source = _arg_1;
            }, "_SignInPanel_Image1.source");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SIGN_IN_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SignInPanel_Text1.text = _arg_1;
            }, "_SignInPanel_Text1.text");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (QianDaoKaPai1);
            }, function (_arg_1:Object):void
            {
                imgBackGround1.source = _arg_1;
            }, "imgBackGround1.source");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SIGN_IN_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                imgBackGround1.toolTip = _arg_1;
            }, "imgBackGround1.toolTip");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SIGN_IN_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SignInPanel_Label2.text = _arg_1;
            }, "_SignInPanel_Label2.text");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (YiQianDao);
            }, function (_arg_1:Object):void
            {
                imgSignin1.source = _arg_1;
            }, "imgSignin1.source");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SIGN_IN_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                signin1.label = _arg_1;
            }, "signin1.label");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (QianDaoKaPai1);
            }, function (_arg_1:Object):void
            {
                imgBackGround2.source = _arg_1;
            }, "imgBackGround2.source");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SIGN_IN_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                imgBackGround2.toolTip = _arg_1;
            }, "imgBackGround2.toolTip");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SIGN_IN_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SignInPanel_Label3.text = _arg_1;
            }, "_SignInPanel_Label3.text");
            result[10] = binding;
            binding = new Binding(this, function ():Object
            {
                return (YiQianDao);
            }, function (_arg_1:Object):void
            {
                imgSignin2.source = _arg_1;
            }, "imgSignin2.source");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SIGN_IN_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                signin2.label = _arg_1;
            }, "signin2.label");
            result[12] = binding;
            binding = new Binding(this, function ():Object
            {
                return (QianDaoKaPai1);
            }, function (_arg_1:Object):void
            {
                imgBackGround3.source = _arg_1;
            }, "imgBackGround3.source");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SIGN_IN_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                imgBackGround3.toolTip = _arg_1;
            }, "imgBackGround3.toolTip");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SIGN_IN_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SignInPanel_Label4.text = _arg_1;
            }, "_SignInPanel_Label4.text");
            result[15] = binding;
            binding = new Binding(this, function ():Object
            {
                return (YiQianDao);
            }, function (_arg_1:Object):void
            {
                imgSignin3.source = _arg_1;
            }, "imgSignin3.source");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SIGN_IN_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                signin3.label = _arg_1;
            }, "signin3.label");
            result[17] = binding;
            binding = new Binding(this, function ():Object
            {
                return (QianDaoKaPai1);
            }, function (_arg_1:Object):void
            {
                imgBackGround4.source = _arg_1;
            }, "imgBackGround4.source");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SIGN_IN_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                imgBackGround4.toolTip = _arg_1;
            }, "imgBackGround4.toolTip");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SIGN_IN_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SignInPanel_Label5.text = _arg_1;
            }, "_SignInPanel_Label5.text");
            result[20] = binding;
            binding = new Binding(this, function ():Object
            {
                return (YiQianDao);
            }, function (_arg_1:Object):void
            {
                imgSignin4.source = _arg_1;
            }, "imgSignin4.source");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SIGN_IN_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                signin4.label = _arg_1;
            }, "signin4.label");
            result[22] = binding;
            binding = new Binding(this, function ():Object
            {
                return (QianDaoKaPai1);
            }, function (_arg_1:Object):void
            {
                imgBackGround5.source = _arg_1;
            }, "imgBackGround5.source");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SIGN_IN_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                imgBackGround5.toolTip = _arg_1;
            }, "imgBackGround5.toolTip");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SIGN_IN_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SignInPanel_Label6.text = _arg_1;
            }, "_SignInPanel_Label6.text");
            result[25] = binding;
            binding = new Binding(this, function ():Object
            {
                return (YiQianDao);
            }, function (_arg_1:Object):void
            {
                imgSignin5.source = _arg_1;
            }, "imgSignin5.source");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SIGN_IN_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                signin5.label = _arg_1;
            }, "signin5.label");
            result[27] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get imgBackGround1():Image
        {
            return (this._1934594272imgBackGround1);
        }

        [Bindable(event="propertyChange")]
        public function get imgBackGround3():Image
        {
            return (this._1934594274imgBackGround3);
        }

        public function onGetSignInData(_arg_1:Object):void
        {
            var _local_4:*;
            if (!_arg_1)
            {
                return;
            };
            var _local_2:Number = _arg_1.continueSigninTime;
            var _local_3:Boolean = _arg_1.signinedToday;
            _local_4 = 1;
            while (_local_4 <= 5)
            {
                this[("signin" + _local_4)].enabled = false;
                this[("imgSignin" + _local_4)].visible = false;
                this[("imgBackGround" + _local_4)].source = QianDaoKaPai1;
                _local_4++;
            };
            var _local_5:Boolean = _arg_1.signedYesterday;
            if (!_local_5)
            {
                if (_local_3)
                {
                    this["signin1"].enabled = false;
                    this["imgBackGround1"].source = QianDaoKaPai1;
                    this["imgSignin1"].visible = true;
                }
                else
                {
                    this["signin1"].enabled = true;
                    this["imgBackGround1"].source = QianDaoKaPai;
                };
                _local_4 = 2;
                while (_local_4 <= 5)
                {
                    this[("imgBackGround" + _local_4)].source = QianDaoKaPai1;
                    _local_4++;
                };
            }
            else
            {
                if (!_local_3)
                {
                    if (_local_2 == 4)
                    {
                        this["signin5"].enabled = true;
                        this["imgBackGround5"].source = QianDaoKaPai;
                    }
                    else
                    {
                        this[("signin" + ((_local_2 + 1) % 5))].enabled = true;
                        this[("imgBackGround" + ((_local_2 + 1) % 5))].source = QianDaoKaPai;
                    };
                    if (_local_2 != 5)
                    {
                        _local_4 = 1;
                        while (_local_4 <= _local_2)
                        {
                            this[("imgSignin" + _local_4)].visible = true;
                            _local_4++;
                        };
                    };
                }
                else
                {
                    _local_4 = 1;
                    while (_local_4 <= _local_2)
                    {
                        this[("imgSignin" + _local_4)].visible = true;
                        _local_4++;
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get imgBackGround5():Image
        {
            return (this._1934594276imgBackGround5);
        }

        [Bindable(event="propertyChange")]
        public function get imgBackGround2():Image
        {
            return (this._1934594273imgBackGround2);
        }

        [Bindable(event="propertyChange")]
        public function get title2():Canvas
        {
            return (this._873453350title2);
        }

        [Bindable(event="propertyChange")]
        public function get imgBackGround4():Image
        {
            return (this._1934594275imgBackGround4);
        }

        [Bindable(event="propertyChange")]
        public function get signin5():Button
        {
            return (this._2088273107signin5);
        }

        public function set myLevel2(_arg_1:Label):void
        {
            var _local_2:Object = this._1020731910myLevel2;
            if (_local_2 !== _arg_1)
            {
                this._1020731910myLevel2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myLevel2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get myLevel2():Label
        {
            return (this._1020731910myLevel2);
        }

        public function __signin4_click(_arg_1:MouseEvent):void
        {
            signin();
        }


    }
}//package com.qeedoo.ui.view.compDragable

