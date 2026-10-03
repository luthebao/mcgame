// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.AwakenSkillBox

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.HBox;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.controls.Button;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.utils.LanguageUtil;
    import flash.net.Responder;
    import flash.events.Event;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.view.compMain.UserBarCanvas;
    import flash.events.MouseEvent;
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

    public class AwakenSkillBox extends HBox implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1656229167levelText:Label;
        private var _1990847082skillIcon:Image;
        private var _skillMeta:Object;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":HBox,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___AwakenSkillBox_Button1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({"styleName":"BtnReduce"});
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"TransparentSlot",
                                "mouseEnabled":false,
                                "width":34,
                                "height":34,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"skillIcon",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.verticalCenter = "0";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"levelText",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.bottom = "0";
                                        this.right = "0";
                                        this.fontSize = 8;
                                        this.fontFamily = "Arial";
                                        this.textAlign = "right";
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___AwakenSkillBox_Button2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({"styleName":"BtnAdd"});
                        }
                    })]});
            }
        });
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function AwakenSkillBox()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.horizontalGap = 2;
                this.verticalAlign = "middle";
            };
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AwakenSkillBox._watcherSetupUtil = _arg_1;
        }


        public function cleanView():void
        {
            _skillMeta = null;
            skillIcon.source = null;
            levelText.text = "";
            skillIcon.toolTip = "";
        }

        override public function initialize():void
        {
            var target:AwakenSkillBox;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _AwakenSkillBox_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_AwakenSkillBoxWatcherSetupUtil");
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
        public function get levelText():Label
        {
            return (this._1656229167levelText);
        }

        public function updateView(_arg_1:Object):void
        {
            _skillMeta = _arg_1;
            if (!_skillMeta)
            {
                this.cleanView();
                return;
            };
            skillIcon.source = ResManager.getIconUrl(_arg_1.iconCode);
            this.updateLevelAndTip();
        }

        private function _AwakenSkillBox_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }

        private function addPointHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            if (!_skillMeta)
            {
                return;
            };
            var _local_2:int = int(_skillMeta.costPoints);
            if (_core.player.awakenPoint < _local_2)
            {
                _core.sysMidNote(Language.AWAKEN_PANEL[17]);
                return;
            };
            var _local_3:int = int(_skillMeta.maxLevel);
            var _local_4:int = int(_skillMeta.reqPoints);
            var _local_5:String = _skillMeta.skillCodeName;
            var _local_6:Array = _local_5.split("|");
            var _local_7:Object = _core.player.awakenPointDict;
            var _local_8:String = _local_6[0];
            var _local_9:int = (((_local_7) && (_local_7.hasOwnProperty(_local_8))) ? _local_7[_local_8] : 0);
            if (_local_9 >= _local_3)
            {
                _core.sysMidNote(Language.AWAKEN_PANEL[18]);
                return;
            };
            if (_core.player.awakenPointUsed < _local_4)
            {
                _core.sysMidNote(LanguageUtil.replace(Language.AWAKEN_PANEL[19], {"num":_local_4}));
                return;
            };
            _core.remote.call("addAwakenPoint", new Responder(onAddAwakenPoint), _skillMeta.id);
        }

        private function updateLevelAndTip():void
        {
            if (!_skillMeta)
            {
                this.cleanView();
                return;
            };
            var _local_1:String = _skillMeta.skillCodeName;
            var _local_2:Array = _local_1.split("|");
            var _local_3:String = _local_2[0];
            var _local_4:Object = _core.player.awakenPointDict;
            var _local_5:int = (((_local_4) && (_local_4.hasOwnProperty(_local_3))) ? _local_4[_local_3] : 0);
            levelText.htmlText = ((_local_5 > 0) ? (("<font color='#00FF00'>" + _local_5) + "</font>") : String(_local_5));
            var _local_6:int = int(_skillMeta.maxLevel);
            var _local_7:String = _skillMeta.description;
            var _local_8:Array = _local_7.split("|");
            var _local_9:int = ((_local_5 > 0) ? (_local_5 - 1) : _local_5);
            var _local_10:String = ((((((("<font color='#FFFF00'>" + _skillMeta.name) + Language.AWAKEN_PANEL[13]) + _local_5) + "/") + _local_6) + "</font>\n") + _local_8[_local_9]);
            if (_local_5 == 0)
            {
                if (((_skillMeta.reqPoints) && (Number(_skillMeta.reqPoints) > 0)))
                {
                    _local_10 = (_local_10 + LanguageUtil.replace(Language.AWAKEN_PANEL[14], {"num":_skillMeta.reqPoints}));
                };
            }
            else
            {
                if (((_local_5 < _local_6) && (_local_8[(_local_9 + 1)])))
                {
                    _local_10 = (_local_10 + (Language.AWAKEN_PANEL[15] + _local_8[(_local_9 + 1)]));
                };
            };
            _local_10 = (_local_10 + LanguageUtil.replace(Language.AWAKEN_PANEL[22], {"num":_skillMeta.costPoints}));
            skillIcon.toolTip = _local_10;
        }

        private function reducePointHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            if (!_skillMeta)
            {
                return;
            };
            var _local_2:String = _skillMeta.skillCodeName;
            var _local_3:Object = _core.player.awakenPointDict;
            var _local_4:Array = _local_2.split("|");
            var _local_5:String = _local_4[0];
            if ((((!(_local_3)) || (!(_local_3.hasOwnProperty(_local_5)))) || (Number(_local_3[_local_5]) <= 0)))
            {
                _core.sysMidNote(Language.AWAKEN_PANEL[16]);
                return;
            };
            _core.remote.call("reduceAwakenPoint", new Responder(onAddAwakenPoint), _skillMeta.id);
        }

        public function set levelText(_arg_1:Label):void
        {
            var _local_2:Object = this._1656229167levelText;
            if (_local_2 !== _arg_1)
            {
                this._1656229167levelText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelText", _local_2, _arg_1));
            };
        }

        public function set skillIcon(_arg_1:Image):void
        {
            var _local_2:Object = this._1990847082skillIcon;
            if (_local_2 !== _arg_1)
            {
                this._1990847082skillIcon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillIcon", _local_2, _arg_1));
            };
        }

        private function onAddAwakenPoint(_arg_1:Object=null):void
        {
            if (!_arg_1)
            {
                return;
            };
            _core.player.awakenPoint = _arg_1.awakenPoint;
            _core.player.awakenPointUsed = _arg_1.awakenPointUsed;
            _core.player.awakenPointDict = _arg_1.awakenDict;
            this.updateLevelAndTip();
            var _local_2:AwakenPanel = (_core.view.getUI(ViewManager.PANEL_AWAKEN) as AwakenPanel);
            ((_local_2.initialized) && (_local_2.updatePoints()));
            var _local_3:SkillManager = (_core.view.getUI(ViewManager.PANEL_SKILLMANAGER) as SkillManager);
            ((_local_3.initialized) && (_local_3.update()));
            var _local_4:UserBarCanvas = (_core.view.getUI(ViewManager.MAIN_USER_BAR) as UserBarCanvas);
            ((_local_4.initialized) && (_local_4.initView()));
            var _local_5:BattleSettingPanel = (_core.view.getUI(ViewManager.PANEL_BATTLESET) as BattleSettingPanel);
            ((_local_5.initialized) && (_local_5.initView()));
        }

        [Bindable(event="propertyChange")]
        public function get skillIcon():Image
        {
            return (this._1990847082skillIcon);
        }

        public function ___AwakenSkillBox_Button1_click(_arg_1:MouseEvent):void
        {
            reducePointHandler(_arg_1);
        }

        public function ___AwakenSkillBox_Button2_click(_arg_1:MouseEvent):void
        {
            addPointHandler(_arg_1);
        }

        private function _AwakenSkillBox_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                levelText.filters = _arg_1;
            }, "levelText.filters");
            result[0] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view.compDragable

