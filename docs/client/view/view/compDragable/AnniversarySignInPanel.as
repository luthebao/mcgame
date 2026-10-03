// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.AnniversarySignInPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.controls.Text;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.CharactorShowCanvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.net.Responder;
    import flash.events.MouseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.view.ViewManager;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.controls.Alert;
    import com.adobe.crypto.MD5;
    import mx.events.CloseEvent;
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

    public class AnniversarySignInPanel extends DragableCanvas implements IBindingClient 
    {

        private static const FAIRY_BACKGROUND:Class = AnniversarySignInPanel_FAIRY_BACKGROUND;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3236047img2:Image;
        private var _2143218000itemText0:Text;
        private var _3236049img4:Image;
        private var _879099501signInCount:Text;
        private var _100525953item4:ItemSlot;
        private var _3236050img5:Image;
        private var _2143218001itemText1:Text;
        private var _3034453btn1:BasicGlowButton;
        private var _3034455btn3:BasicGlowButton;
        private var _100525950item1:ItemSlot;
        private var _3034457btn5:BasicGlowButton;
        private var _2143218002itemText2:Text;
        private var today:String = null;
        private var _1144939184btn_getBigAward:Button;
        public var _AnniversarySignInPanel_Image10:Image;
        public var _AnniversarySignInPanel_Image11:Image;
        public var _AnniversarySignInPanel_Image12:Image;
        public var _AnniversarySignInPanel_Image13:Image;
        private var _2143218003itemText3:Text;
        public var _AnniversarySignInPanel_Image1:Image;
        public var _AnniversarySignInPanel_Image2:Image;
        public var _AnniversarySignInPanel_Image3:Image;
        public var _AnniversarySignInPanel_Image5:Image;
        public var _AnniversarySignInPanel_Image6:Image;
        public var _AnniversarySignInPanel_Image7:Image;
        public var _AnniversarySignInPanel_Image20:Image;
        public var _AnniversarySignInPanel_Image9:Image;
        public var _AnniversarySignInPanel_Image4:Image;
        private var _100525952item3:ItemSlot;
        public var _AnniversarySignInPanel_Image8:Image;
        public var ASI_SIGNIN_BIGAWARD:* = 7242;
        private var _2143218004itemText4:Text;
        private var _3236046img1:Image;
        private var _3236048img3:Image;
        private var _100525949item0:ItemSlot;
        private var _2143218005itemText5:Text;
        private var _3034452btn0:BasicGlowButton;
        private var _firstTimeFlag:Boolean = true;
        private var _3034454btn2:BasicGlowButton;
        private var _3034456btn4:BasicGlowButton;
        private var _100525954item5:ItemSlot;
        public var _AnniversarySignInPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _100525951item2:ItemSlot;
        private var _307382965showCanvas:CharactorShowCanvas;
        private var _3236045img0:Image;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":619,
                    "height":465,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_AnniversarySignInPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"_AnniversarySignInPanel_Image1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5,
                                "y":32
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"_AnniversarySignInPanel_Image2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":230,
                                "y":50
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"_AnniversarySignInPanel_Image3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":355,
                                "y":50
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"_AnniversarySignInPanel_Image4",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":480,
                                "y":50
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"_AnniversarySignInPanel_Image5",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":230,
                                "y":0xFF
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"_AnniversarySignInPanel_Image6",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":355,
                                "y":0xFF
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"_AnniversarySignInPanel_Image7",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":480,
                                "y":0xFF
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"_AnniversarySignInPanel_Image8",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":230,
                                "y":50
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"_AnniversarySignInPanel_Image9",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":355,
                                "y":50
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"_AnniversarySignInPanel_Image10",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":480,
                                "y":50
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"_AnniversarySignInPanel_Image11",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":230,
                                "y":0xFF
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"_AnniversarySignInPanel_Image12",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":355,
                                "y":0xFF
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"_AnniversarySignInPanel_Image13",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":480,
                                "y":0xFF
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"item0",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "movable":false,
                                "acceptable":false,
                                "x":270,
                                "y":115
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"item1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "movable":false,
                                "acceptable":false,
                                "x":395,
                                "y":115
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"item2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "movable":false,
                                "acceptable":false,
                                "x":520,
                                "y":115
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"item3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "movable":false,
                                "acceptable":false,
                                "x":270,
                                "y":320
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"item4",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "movable":false,
                                "acceptable":false,
                                "x":395,
                                "y":320
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"item5",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "movable":false,
                                "acceptable":false,
                                "x":520,
                                "y":320
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"img0",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":230,
                                "y":50,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"img1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":355,
                                "y":50,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"img2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":480,
                                "y":50,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"img3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":230,
                                "y":0xFF,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"img4",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":355,
                                "y":0xFF,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"img5",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":480,
                                "y":0xFF,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"_AnniversarySignInPanel_Image20",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":15,
                                "y":42
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":CharactorShowCanvas,
                        "id":"showCanvas",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":160,
                                "y":245,
                                "height":13,
                                "width":10
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Text,
                        "id":"itemText0",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "text":"",
                                "x":230,
                                "y":170,
                                "height":158
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Text,
                        "id":"itemText1",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "text":"",
                                "x":355,
                                "y":170,
                                "height":158
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Text,
                        "id":"itemText2",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "text":"",
                                "x":480,
                                "y":170,
                                "height":158
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Text,
                        "id":"itemText3",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "text":"",
                                "x":230,
                                "y":375,
                                "height":158
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Text,
                        "id":"itemText4",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "text":"",
                                "x":355,
                                "y":375,
                                "height":158
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Text,
                        "id":"itemText5",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "text":"",
                                "x":480,
                                "y":375,
                                "height":158
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Text,
                        "id":"signInCount",
                        "stylesFactory":function ():void
                        {
                            this.left = "70";
                            this.fontSize = 12;
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":340,
                                "text":"累计签到: 0/6天",
                                "width":418,
                                "height":158
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btn_getBigAward",
                        "events":{"click":"__btn_getBigAward_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnASIGETAWARD",
                                "width":121,
                                "height":39,
                                "x":58,
                                "y":370,
                                "enabled":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"btn0",
                        "events":{"click":"__btn0_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdGreen",
                                "label":"未开始",
                                "x":265,
                                "y":210
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"btn1",
                        "events":{"click":"__btn1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdGreen",
                                "label":"未开始",
                                "x":390,
                                "y":210
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"btn2",
                        "events":{"click":"__btn2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdGreen",
                                "label":"未开始",
                                "x":515,
                                "y":210
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"btn3",
                        "events":{"click":"__btn3_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdGreen",
                                "label":"未开始",
                                "x":265,
                                "y":415
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"btn4",
                        "events":{"click":"__btn4_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdGreen",
                                "label":"未开始",
                                "x":390,
                                "y":415
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"btn5",
                        "events":{"click":"__btn5_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdGreen",
                                "label":"未开始",
                                "x":515,
                                "y":415
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var ASI_SIGNIN_DATE_LIST:* = ["0919", "0920", "0921", "0922", "0923", "0924"];
        public var ASI_SIGNIN_AWARD_MAP:Object = {
            "0":{
                "i":7247,
                "n":1
            },
            "1":{
                "i":7247,
                "n":1
            },
            "2":{
                "i":7247,
                "n":1
            },
            "3":{
                "i":7247,
                "n":1
            },
            "4":{
                "i":7247,
                "n":1
            },
            "5":{
                "i":7247,
                "n":1
            }
        };
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function AnniversarySignInPanel()
        {
            mx_internal::_document = this;
            this.width = 619;
            this.height = 465;
            this.styleName = "StandardContent";
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AnniversarySignInPanel._watcherSetupUtil = _arg_1;
        }


        public function set item3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._100525952item3;
            if (_local_2 !== _arg_1)
            {
                this._100525952item3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item3", _local_2, _arg_1));
            };
        }

        public function set item5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._100525954item5;
            if (_local_2 !== _arg_1)
            {
                this._100525954item5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item5", _local_2, _arg_1));
            };
        }

        public function showPanel():void
        {
            visible = true;
            _core.remote.call("getASIInfo", new Responder(onGetASIInfo), _core.cid);
        }

        public function __btn5_click(_arg_1:MouseEvent):void
        {
            signin(5);
        }

        public function set item1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._100525950item1;
            if (_local_2 !== _arg_1)
            {
                this._100525950item1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item1", _local_2, _arg_1));
            };
        }

        public function __btn1_click(_arg_1:MouseEvent):void
        {
            signin(1);
        }

        public function updateView(_arg_1:Object):void
        {
            var _local_3:int;
            var _local_4:String;
            var _local_5:Object;
            var _local_6:Object;
            today = _arg_1.today;
            var _local_2:int;
            if (today)
            {
                _local_3 = 0;
                while (_local_3 < 6)
                {
                    _local_4 = ASI_SIGNIN_DATE_LIST[_local_3];
                    if (_arg_1.date[_local_3] == 1)
                    {
                        this[("btn" + _local_3)].label = "已签到";
                        this[("btn" + _local_3)].enabled = false;
                        this[("img" + _local_3)].visible = true;
                        _local_2++;
                    }
                    else
                    {
                        this[("img" + _local_3)].visible = false;
                        if (today > _local_4)
                        {
                            this[("btn" + _local_3)].label = "补签";
                            this[("btn" + _local_3)].enabled = true;
                        }
                        else
                        {
                            if (today == _local_4)
                            {
                                this[("btn" + _local_3)].label = "签到";
                                this[("btn" + _local_3)].enabled = true;
                            }
                            else
                            {
                                this[("btn" + _local_3)].label = "未开始";
                                this[("btn" + _local_3)].enabled = false;
                            };
                        };
                    };
                    _local_5 = ASI_SIGNIN_AWARD_MAP[_local_3];
                    _local_6 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_5.i];
                    this[("itemText" + _local_3)].text = ((("[" + _local_6.name) + "]*") + _local_5.n);
                    this[("item" + _local_3)].slotData = _local_6;
                    this[("item" + _local_3)].giid = _local_5.i;
                    _local_3++;
                };
                signInCount.text = (("累计签到: " + _local_2) + "/6天");
                if (_arg_1.isGetBigAward == 1)
                {
                    btn_getBigAward.enabled = false;
                }
                else
                {
                    if (_local_2 == 6)
                    {
                        btn_getBigAward.enabled = true;
                    };
                };
            };
        }

        public function set item0(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._100525949item0;
            if (_local_2 !== _arg_1)
            {
                this._100525949item0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item0", _local_2, _arg_1));
            };
        }

        public function set item2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._100525951item2;
            if (_local_2 !== _arg_1)
            {
                this._100525951item2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item2", _local_2, _arg_1));
            };
        }

        public function set item4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._100525953item4;
            if (_local_2 !== _arg_1)
            {
                this._100525953item4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item4", _local_2, _arg_1));
            };
        }

        private function _AnniversarySignInPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.ASP_PANEL[0];
            _local_1 = ResManager.getIconUrl(4130220004000);
            _local_1 = ResManager.getIconUrl(4130220004007);
            _local_1 = ResManager.getIconUrl(4130220004007);
            _local_1 = ResManager.getIconUrl(4130220004007);
            _local_1 = ResManager.getIconUrl(4130220004007);
            _local_1 = ResManager.getIconUrl(4130220004007);
            _local_1 = ResManager.getIconUrl(4130220004007);
            _local_1 = ResManager.getIconUrl(4130220004001);
            _local_1 = ResManager.getIconUrl(4130220004002);
            _local_1 = ResManager.getIconUrl(4130220004003);
            _local_1 = ResManager.getIconUrl(4130220004004);
            _local_1 = ResManager.getIconUrl(4130220004005);
            _local_1 = ResManager.getIconUrl(4130220004006);
            _local_1 = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1 = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1 = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1 = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1 = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1 = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1 = ResManager.getIconUrl(4130220004009);
            _local_1 = ResManager.getIconUrl(4130220004009);
            _local_1 = ResManager.getIconUrl(4130220004009);
            _local_1 = ResManager.getIconUrl(4130220004009);
            _local_1 = ResManager.getIconUrl(4130220004009);
            _local_1 = ResManager.getIconUrl(4130220004009);
            _local_1 = ResManager.getIconUrl(4130220004008);
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
        }

        public function __btn2_click(_arg_1:MouseEvent):void
        {
            signin(2);
        }

        private function doUnlockMoneyGold(_arg_1:Boolean):void
        {
            var _local_2:BagPanel;
            var _local_3:Boolean;
            if (_arg_1)
            {
                _local_2 = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                _local_3 = _local_2.goldLockFlag;
                if (((!(_local_3 == false)) && (_local_2)))
                {
                    _local_2.goldLockFlag = false;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get itemText2():Text
        {
            return (this._2143218002itemText2);
        }

        [Bindable(event="propertyChange")]
        public function get itemText3():Text
        {
            return (this._2143218003itemText3);
        }

        [Bindable(event="propertyChange")]
        public function get btn1():BasicGlowButton
        {
            return (this._3034453btn1);
        }

        [Bindable(event="propertyChange")]
        public function get btn2():BasicGlowButton
        {
            return (this._3034454btn2);
        }

        [Bindable(event="propertyChange")]
        public function get btn3():BasicGlowButton
        {
            return (this._3034455btn3);
        }

        [Bindable(event="propertyChange")]
        public function get btn5():BasicGlowButton
        {
            return (this._3034457btn5);
        }

        [Bindable(event="propertyChange")]
        public function get btn4():BasicGlowButton
        {
            return (this._3034456btn4);
        }

        [Bindable(event="propertyChange")]
        public function get itemText5():Text
        {
            return (this._2143218005itemText5);
        }

        public function set showCanvas(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object = this._307382965showCanvas;
            if (_local_2 !== _arg_1)
            {
                this._307382965showCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCanvas", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get signInCount():Text
        {
            return (this._879099501signInCount);
        }

        [Bindable(event="propertyChange")]
        public function get btn0():BasicGlowButton
        {
            return (this._3034452btn0);
        }

        [Bindable(event="propertyChange")]
        public function get btn_getBigAward():Button
        {
            return (this._1144939184btn_getBigAward);
        }

        public function __btn3_click(_arg_1:MouseEvent):void
        {
            signin(3);
        }

        [Bindable(event="propertyChange")]
        public function get item4():ItemSlot
        {
            return (this._100525953item4);
        }

        [Bindable(event="propertyChange")]
        public function get item0():ItemSlot
        {
            return (this._100525949item0);
        }

        [Bindable(event="propertyChange")]
        public function get item3():ItemSlot
        {
            return (this._100525952item3);
        }

        [Bindable(event="propertyChange")]
        public function get item1():ItemSlot
        {
            return (this._100525950item1);
        }

        [Bindable(event="propertyChange")]
        public function get item2():ItemSlot
        {
            return (this._100525951item2);
        }

        override public function initialize():void
        {
            var target:AnniversarySignInPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _AnniversarySignInPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_AnniversarySignInPanelWatcherSetupUtil");
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

        [Bindable(event="propertyChange")]
        public function get item5():ItemSlot
        {
            return (this._100525954item5);
        }

        public function set img0(_arg_1:Image):void
        {
            var _local_2:Object = this._3236045img0;
            if (_local_2 !== _arg_1)
            {
                this._3236045img0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img0", _local_2, _arg_1));
            };
        }

        private function signin(idx:int):void
        {
            var func:Function;
            var str:String = ASI_SIGNIN_DATE_LIST[idx];
            if (today > str)
            {
                func = function (event:CloseEvent):void
                {
                    var bagPanel:BagPanel;
                    var goldLockFlag:Boolean;
                    var gfunc:Function;
                    if (event.detail == Alert.YES)
                    {
                        bagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                        goldLockFlag = bagPanel.goldLockFlag;
                        if (((goldLockFlag) || (!(bagPanel))))
                        {
                            _core.sysMsg(Language.JUHUASUAN_PANEL[15]);
                            gfunc = function (_arg_1:String):void
                            {
                                _core.remote.call("unlockMoney", new Responder(doUnlockMoneyGold), MD5.hash(_arg_1));
                            };
                            _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], gfunc);
                            return;
                        };
                        _core.remote.call("ASIReSignIn", new Responder(onGetASIInfo), _core.cid, idx);
                    };
                };
                Alert.show("是否消耗100金子完成补签?", "", (Alert.YES | Alert.NO), null, func);
            }
            else
            {
                if (today == str)
                {
                    _core.remote.call("ASISignIn", new Responder(onGetASIInfo), _core.cid, idx);
                };
            };
        }

        public function set img5(_arg_1:Image):void
        {
            var _local_2:Object = this._3236050img5;
            if (_local_2 !== _arg_1)
            {
                this._3236050img5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img5", _local_2, _arg_1));
            };
        }

        public function set img2(_arg_1:Image):void
        {
            var _local_2:Object = this._3236047img2;
            if (_local_2 !== _arg_1)
            {
                this._3236047img2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img2", _local_2, _arg_1));
            };
        }

        public function set itemText3(_arg_1:Text):void
        {
            var _local_2:Object = this._2143218003itemText3;
            if (_local_2 !== _arg_1)
            {
                this._2143218003itemText3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemText3", _local_2, _arg_1));
            };
        }

        public function set btn_getBigAward(_arg_1:Button):void
        {
            var _local_2:Object = this._1144939184btn_getBigAward;
            if (_local_2 !== _arg_1)
            {
                this._1144939184btn_getBigAward = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_getBigAward", _local_2, _arg_1));
            };
        }

        public function set img4(_arg_1:Image):void
        {
            var _local_2:Object = this._3236049img4;
            if (_local_2 !== _arg_1)
            {
                this._3236049img4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img4", _local_2, _arg_1));
            };
        }

        public function set img1(_arg_1:Image):void
        {
            var _local_2:Object = this._3236046img1;
            if (_local_2 !== _arg_1)
            {
                this._3236046img1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img1", _local_2, _arg_1));
            };
        }

        public function set btn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._3034455btn3;
            if (_local_2 !== _arg_1)
            {
                this._3034455btn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn3", _local_2, _arg_1));
            };
        }

        public function set btn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._3034452btn0;
            if (_local_2 !== _arg_1)
            {
                this._3034452btn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn0", _local_2, _arg_1));
            };
        }

        public function set btn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._3034453btn1;
            if (_local_2 !== _arg_1)
            {
                this._3034453btn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn1", _local_2, _arg_1));
            };
        }

        public function set btn5(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._3034457btn5;
            if (_local_2 !== _arg_1)
            {
                this._3034457btn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn5", _local_2, _arg_1));
            };
        }

        private function getBigAward():void
        {
            _core.remote.call("getASIBigAward", new Responder(onGetASIInfo), _core.cid);
        }

        [Bindable(event="propertyChange")]
        public function get itemText1():Text
        {
            return (this._2143218001itemText1);
        }

        [Bindable(event="propertyChange")]
        public function get showCanvas():CharactorShowCanvas
        {
            return (this._307382965showCanvas);
        }

        public function set itemText5(_arg_1:Text):void
        {
            var _local_2:Object = this._2143218005itemText5;
            if (_local_2 !== _arg_1)
            {
                this._2143218005itemText5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemText5", _local_2, _arg_1));
            };
        }

        public function set itemText1(_arg_1:Text):void
        {
            var _local_2:Object = this._2143218001itemText1;
            if (_local_2 !== _arg_1)
            {
                this._2143218001itemText1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemText1", _local_2, _arg_1));
            };
        }

        public function set btn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._3034454btn2;
            if (_local_2 !== _arg_1)
            {
                this._3034454btn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn2", _local_2, _arg_1));
            };
        }

        public function set itemText2(_arg_1:Text):void
        {
            var _local_2:Object = this._2143218002itemText2;
            if (_local_2 !== _arg_1)
            {
                this._2143218002itemText2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemText2", _local_2, _arg_1));
            };
        }

        public function __btn0_click(_arg_1:MouseEvent):void
        {
            signin(0);
        }

        public function set btn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._3034456btn4;
            if (_local_2 !== _arg_1)
            {
                this._3034456btn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn4", _local_2, _arg_1));
            };
        }

        public function set itemText4(_arg_1:Text):void
        {
            var _local_2:Object = this._2143218004itemText4;
            if (_local_2 !== _arg_1)
            {
                this._2143218004itemText4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemText4", _local_2, _arg_1));
            };
        }

        public function set img3(_arg_1:Image):void
        {
            var _local_2:Object = this._3236048img3;
            if (_local_2 !== _arg_1)
            {
                this._3236048img3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get itemText0():Text
        {
            return (this._2143218000itemText0);
        }

        [Bindable(event="propertyChange")]
        public function get itemText4():Text
        {
            return (this._2143218004itemText4);
        }

        [Bindable(event="propertyChange")]
        public function get img0():Image
        {
            return (this._3236045img0);
        }

        [Bindable(event="propertyChange")]
        public function get img2():Image
        {
            return (this._3236047img2);
        }

        [Bindable(event="propertyChange")]
        public function get img4():Image
        {
            return (this._3236049img4);
        }

        override public function initView():void
        {
            showFairy();
            _core.remote.call("getASIInfo", new Responder(onGetASIInfo), _core.cid);
        }

        private function showFairy():void
        {
            var _local_2:String;
            _firstTimeFlag = false;
            var _local_1:Object = GameData.d[GamePredef.TBL_FAIRY_TEMPALTE][17];
            if (_local_1)
            {
                _local_2 = ResManager.getResUrl(_local_1.rc);
                if (showCanvas.url != _local_2)
                {
                    showCanvas.url = _local_2;
                };
                showCanvas.color = _local_1.cc;
            }
            else
            {
                return;
            };
        }

        public function __btn4_click(_arg_1:MouseEvent):void
        {
            signin(4);
        }

        [Bindable(event="propertyChange")]
        public function get img5():Image
        {
            return (this._3236050img5);
        }

        private function _AnniversarySignInPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ASP_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AnniversarySignInPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_AnniversarySignInPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220004000));
            }, function (_arg_1:Object):void
            {
                _AnniversarySignInPanel_Image1.source = _arg_1;
            }, "_AnniversarySignInPanel_Image1.source");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220004007));
            }, function (_arg_1:Object):void
            {
                _AnniversarySignInPanel_Image2.source = _arg_1;
            }, "_AnniversarySignInPanel_Image2.source");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220004007));
            }, function (_arg_1:Object):void
            {
                _AnniversarySignInPanel_Image3.source = _arg_1;
            }, "_AnniversarySignInPanel_Image3.source");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220004007));
            }, function (_arg_1:Object):void
            {
                _AnniversarySignInPanel_Image4.source = _arg_1;
            }, "_AnniversarySignInPanel_Image4.source");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220004007));
            }, function (_arg_1:Object):void
            {
                _AnniversarySignInPanel_Image5.source = _arg_1;
            }, "_AnniversarySignInPanel_Image5.source");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220004007));
            }, function (_arg_1:Object):void
            {
                _AnniversarySignInPanel_Image6.source = _arg_1;
            }, "_AnniversarySignInPanel_Image6.source");
            result[6] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220004007));
            }, function (_arg_1:Object):void
            {
                _AnniversarySignInPanel_Image7.source = _arg_1;
            }, "_AnniversarySignInPanel_Image7.source");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220004001));
            }, function (_arg_1:Object):void
            {
                _AnniversarySignInPanel_Image8.source = _arg_1;
            }, "_AnniversarySignInPanel_Image8.source");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220004002));
            }, function (_arg_1:Object):void
            {
                _AnniversarySignInPanel_Image9.source = _arg_1;
            }, "_AnniversarySignInPanel_Image9.source");
            result[9] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220004003));
            }, function (_arg_1:Object):void
            {
                _AnniversarySignInPanel_Image10.source = _arg_1;
            }, "_AnniversarySignInPanel_Image10.source");
            result[10] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220004004));
            }, function (_arg_1:Object):void
            {
                _AnniversarySignInPanel_Image11.source = _arg_1;
            }, "_AnniversarySignInPanel_Image11.source");
            result[11] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220004005));
            }, function (_arg_1:Object):void
            {
                _AnniversarySignInPanel_Image12.source = _arg_1;
            }, "_AnniversarySignInPanel_Image12.source");
            result[12] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220004006));
            }, function (_arg_1:Object):void
            {
                _AnniversarySignInPanel_Image13.source = _arg_1;
            }, "_AnniversarySignInPanel_Image13.source");
            result[13] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_ITEM_TEMPLATE);
            }, function (_arg_1:int):void
            {
                item0.type = _arg_1;
            }, "item0.type");
            result[14] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_ITEM_TEMPLATE);
            }, function (_arg_1:int):void
            {
                item1.type = _arg_1;
            }, "item1.type");
            result[15] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_ITEM_TEMPLATE);
            }, function (_arg_1:int):void
            {
                item2.type = _arg_1;
            }, "item2.type");
            result[16] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_ITEM_TEMPLATE);
            }, function (_arg_1:int):void
            {
                item3.type = _arg_1;
            }, "item3.type");
            result[17] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_ITEM_TEMPLATE);
            }, function (_arg_1:int):void
            {
                item4.type = _arg_1;
            }, "item4.type");
            result[18] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_ITEM_TEMPLATE);
            }, function (_arg_1:int):void
            {
                item5.type = _arg_1;
            }, "item5.type");
            result[19] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220004009));
            }, function (_arg_1:Object):void
            {
                img0.source = _arg_1;
            }, "img0.source");
            result[20] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220004009));
            }, function (_arg_1:Object):void
            {
                img1.source = _arg_1;
            }, "img1.source");
            result[21] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220004009));
            }, function (_arg_1:Object):void
            {
                img2.source = _arg_1;
            }, "img2.source");
            result[22] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220004009));
            }, function (_arg_1:Object):void
            {
                img3.source = _arg_1;
            }, "img3.source");
            result[23] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220004009));
            }, function (_arg_1:Object):void
            {
                img4.source = _arg_1;
            }, "img4.source");
            result[24] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220004009));
            }, function (_arg_1:Object):void
            {
                img5.source = _arg_1;
            }, "img5.source");
            result[25] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220004008));
            }, function (_arg_1:Object):void
            {
                _AnniversarySignInPanel_Image20.source = _arg_1;
            }, "_AnniversarySignInPanel_Image20.source");
            result[26] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                itemText0.filters = _arg_1;
            }, "itemText0.filters");
            result[27] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                itemText1.filters = _arg_1;
            }, "itemText1.filters");
            result[28] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                itemText2.filters = _arg_1;
            }, "itemText2.filters");
            result[29] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                itemText3.filters = _arg_1;
            }, "itemText3.filters");
            result[30] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                itemText4.filters = _arg_1;
            }, "itemText4.filters");
            result[31] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                itemText5.filters = _arg_1;
            }, "itemText5.filters");
            result[32] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                signInCount.filters = _arg_1;
            }, "signInCount.filters");
            result[33] = binding;
            return (result);
        }

        private function onGetASIInfo(_arg_1:Object):void
        {
            var _local_2:int;
            _firstTimeFlag = false;
            if (_arg_1)
            {
                updateView(_arg_1);
            };
        }

        [Bindable(event="propertyChange")]
        public function get img3():Image
        {
            return (this._3236048img3);
        }

        public function set signInCount(_arg_1:Text):void
        {
            var _local_2:Object = this._879099501signInCount;
            if (_local_2 !== _arg_1)
            {
                this._879099501signInCount = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "signInCount", _local_2, _arg_1));
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (_arg_1)
            {
                if (_firstTimeFlag)
                {
                    initView();
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get img1():Image
        {
            return (this._3236046img1);
        }

        public function set itemText0(_arg_1:Text):void
        {
            var _local_2:Object = this._2143218000itemText0;
            if (_local_2 !== _arg_1)
            {
                this._2143218000itemText0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemText0", _local_2, _arg_1));
            };
        }

        public function __btn_getBigAward_click(_arg_1:MouseEvent):void
        {
            getBigAward();
        }


    }
}//package com.qeedoo.ui.view.compDragable

