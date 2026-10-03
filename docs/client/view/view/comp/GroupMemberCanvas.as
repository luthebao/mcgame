// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.GroupMemberCanvas

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.net.Responder;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.config.Language;
    import flash.filters.ColorMatrixFilter;
    import com.qeedoo.game.object.Charactor;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.predef.GamePredef;
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

    public class GroupMemberCanvas extends Canvas implements IBindingClient 
    {

        private static const GROUPAFKIMG:Class = GroupMemberCanvas_GROUPAFKIMG;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _level:String;
        private var _1528665424_is_Afk:Boolean;
        private var _100313435image:Canvas;
        private var _memberMapInfo:GroupMemberMapInfoCanvas;
        private var _2946224_url:String;
        private var _873613749tipAfk:Image;
        private var _1916551235imgHead:Image;
        private var _is_Leader:Boolean;
        private var _lastCallTime:Number = 0;
        private var _name:String;
        private var _class:String;
        private var _cid:Number;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"image",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "width":38,
                                "height":38,
                                "styleName":"CanvasGroupMember",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"imgHead",
                                    "events":{
                                        "rollOver":"__imgHead_rollOver",
                                        "rollOut":"__imgHead_rollOut"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "useHandCursor":true,
                                            "buttonMode":true,
                                            "x":3,
                                            "y":3,
                                            "width":32,
                                            "height":32
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"tipAfk",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":2,
                                            "y":2
                                        });
                                    }
                                })]
                            });
                        }
                    })]});
            }
        });
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function GroupMemberCanvas()
        {
            mx_internal::_document = this;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GroupMemberCanvas._watcherSetupUtil = _arg_1;
        }


        public function set imgHead(_arg_1:Image):void
        {
            var _local_2:Object = this._1916551235imgHead;
            if (_local_2 !== _arg_1)
            {
                this._1916551235imgHead = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgHead", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:GroupMemberCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GroupMemberCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_GroupMemberCanvasWatcherSetupUtil");
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

        private function updateMemberInfo():void
        {
            player = _core.player.getGroupMemberByCid(_cid);
            if (!_memberMapInfo)
            {
                _memberMapInfo = new GroupMemberMapInfoCanvas();
                this.parent.addChildAt(_memberMapInfo, this.parent.numChildren);
            };
            if (((!(_memberMapInfo)) || (!(_memberMapInfo.inCreateComplete))))
            {
                return;
            };
            _memberMapInfo.x = 40.3;
            _memberMapInfo.y = this.y;
            _memberMapInfo.height = 60;
            _memberMapInfo.width = 125;
            _memberMapInfo.charName = _name;
            _memberMapInfo.charclass = _class;
            _memberMapInfo.level = _level;
            if (_memberMapInfo.tip)
            {
                _memberMapInfo.tip.visible = true;
                _memberMapInfo.tip.includeInLayout = true;
            };
            _memberMapInfo.visible = true;
            var _local_1:Date = new Date();
            var _local_2:Number = _local_1.time;
            if ((((_local_2 - _lastCallTime) >= 1000) && (!(_cid == _core.player.id))))
            {
                _core.remote.call("getGroupMemberPosistion", new Responder(onGetGroupMemberInfo), _cid);
                _lastCallTime = _local_2;
            };
        }

        public function set tipAfk(_arg_1:Image):void
        {
            var _local_2:Object = this._873613749tipAfk;
            if (_local_2 !== _arg_1)
            {
                this._873613749tipAfk = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tipAfk", _local_2, _arg_1));
            };
        }

        private function set _is_Afk(_arg_1:Boolean):void
        {
            var _local_2:Object = this._1528665424_is_Afk;
            if (_local_2 !== _arg_1)
            {
                this._1528665424_is_Afk = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_is_Afk", _local_2, _arg_1));
            };
        }

        private function _GroupMemberCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (_url);
            }, function (_arg_1:Object):void
            {
                imgHead.source = _arg_1;
            }, "imgHead.source");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (GROUPAFKIMG);
            }, function (_arg_1:Object):void
            {
                tipAfk.source = _arg_1;
            }, "tipAfk.source");
            result[1] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (_is_Afk);
            }, function (_arg_1:Boolean):void
            {
                tipAfk.visible = _arg_1;
            }, "tipAfk.visible");
            result[2] = binding;
            return (result);
        }

        private function _GroupMemberCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = _url;
            _local_1 = GROUPAFKIMG;
            _local_1 = _is_Afk;
        }

        public function setColorRed():void
        {
        }

        public function __imgHead_rollOut(_arg_1:MouseEvent):void
        {
            hidenMemberInfo();
        }

        public function set image(_arg_1:Canvas):void
        {
            var _local_2:Object = this._100313435image;
            if (_local_2 !== _arg_1)
            {
                this._100313435image = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "image", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get _url():String
        {
            return (this._2946224_url);
        }

        public function set player(_arg_1:Charactor):void
        {
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:Number;
            var _local_2:Core = Core.getInstance();
            _cid = _arg_1.id;
            _url = ResManager.getIconUrl(_arg_1.iconCode);
            _is_Leader = _arg_1.isLeader;
            _is_Afk = _arg_1.groupAfk;
            _name = _arg_1.name;
            _class = _local_2.getClassName(_arg_1.classId);
            _level = (Language.GROUPMEMBERCANVAS_S[0] + _arg_1.level);
            if (_arg_1.groupAfk)
            {
                _local_3 = 0.3086;
                _local_4 = 0.694;
                _local_5 = 0.082;
                this.imgHead.filters = [new ColorMatrixFilter([_local_3, _local_4, _local_5, 0, 0, _local_3, _local_4, _local_5, 0, 0, _local_3, _local_4, _local_5, 0, 0, 0, 0, 0, 1, 0])];
            }
            else
            {
                this.imgHead.filters = [];
            };
        }

        [Bindable(event="propertyChange")]
        public function get imgHead():Image
        {
            return (this._1916551235imgHead);
        }

        public function get cid():Number
        {
            return (_cid);
        }

        private function showInfo():void
        {
            var _local_1:Core = Core.getInstance();
            _local_1.view.getUI(ViewManager.PANEL_CHARACTORINFO).showChaInfo(_cid);
        }

        public function __imgHead_rollOver(_arg_1:MouseEvent):void
        {
            updateMemberInfo();
        }

        public function onGetGroupMemberInfo(_arg_1:Object):void
        {
            var _local_2:String;
            if (_arg_1)
            {
                if (_arg_1.map)
                {
                    _local_2 = _core.data.gameData[GamePredef.TBL_MAP][_arg_1.map].name;
                    if (_local_2)
                    {
                        _memberMapInfo.map = _local_2;
                    };
                };
                if (((_arg_1.x) && (_arg_1.y)))
                {
                    _memberMapInfo.xy = ((Math.floor((_arg_1.x / 10)) + ",") + Math.floor((_arg_1.y / 10)));
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get tipAfk():Image
        {
            return (this._873613749tipAfk);
        }

        public function get isLeader():Boolean
        {
            return (_is_Leader);
        }

        private function set _url(_arg_1:String):void
        {
            var _local_2:Object = this._2946224_url;
            if (_local_2 !== _arg_1)
            {
                this._2946224_url = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_url", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get _is_Afk():Boolean
        {
            return (this._1528665424_is_Afk);
        }

        [Bindable(event="propertyChange")]
        public function get image():Canvas
        {
            return (this._100313435image);
        }

        public function hidenMemberInfo():void
        {
            if (!_memberMapInfo)
            {
                _memberMapInfo = new GroupMemberMapInfoCanvas();
                this.parent.addChildAt(_memberMapInfo, this.parent.numChildren);
            };
            if (((!(_memberMapInfo)) || (!(_memberMapInfo.inCreateComplete))))
            {
                return;
            };
            _memberMapInfo.visible = false;
            if (_memberMapInfo.tip)
            {
                _memberMapInfo.tip.visible = false;
                _memberMapInfo.tip.includeInLayout = false;
            };
        }


    }
}//package com.qeedoo.ui.view.comp

