// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.EnemyHBox

package com.qeedoo.ui.view.comp
{
    import mx.containers.HBox;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Button;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import flash.events.MouseEvent;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.view.compDragable.InputPanel;
    import com.qeedoo.game.view.ViewManager;
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

    public class EnemyHBox extends HBox implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1378835447btnEgg:Button;
        private var _2097447169btnSword:Button;
        private var _242228723btnGlasss:Button;
        private var _547606487btnRaving:Button;
        private var _obj:Object = null;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":HBox,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Button,
                        "id":"btnGlasss",
                        "events":{"click":"__btnGlasss_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({"styleName":"BtnGlass"});
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btnSword",
                        "events":{"click":"__btnSword_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({"styleName":"BtnSword"});
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btnEgg",
                        "events":{"click":"__btnEgg_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({"styleName":"BtnEgg"});
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btnRaving",
                        "events":{"click":"__btnRaving_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({"styleName":"BtnRaving"});
                        }
                    })]});
            }
        });
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function EnemyHBox()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.horizontalGap = 0;
            };
            this.horizontalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            EnemyHBox._watcherSetupUtil = _arg_1;
        }


        public function __btnRaving_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        private function useRaving():void
        {
            _core.remote.useFootle(_obj.name);
        }

        [Bindable(event="propertyChange")]
        public function get btnSword():Button
        {
            return (this._2097447169btnSword);
        }

        private function useFlower(_arg_1:uint):void
        {
            if (_arg_1 <= 0)
            {
                return;
            };
            if (_core.hasFlowerNum() >= _arg_1)
            {
                _core.remote.addPopNum(_obj.name, _arg_1);
            }
            else
            {
                _core.sysMidNote(Language.ENEMYHBOX_S[16]);
            };
        }

        private function useTrack():void
        {
            _core.remote.useTrack(_obj.name);
        }

        public function set btnSword(_arg_1:Button):void
        {
            var _local_2:Object = this._2097447169btnSword;
            if (_local_2 !== _arg_1)
            {
                this._2097447169btnSword = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnSword", _local_2, _arg_1));
            };
        }

        public function set btnEgg(_arg_1:Button):void
        {
            var _local_2:Object = this._1378835447btnEgg;
            if (_local_2 !== _arg_1)
            {
                this._1378835447btnEgg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnEgg", _local_2, _arg_1));
            };
        }

        override public function set data(_arg_1:Object):void
        {
            _obj = _arg_1.revenge;
            if (_arg_1.revenge.isFriend)
            {
                isFriend = true;
            };
        }

        override public function initialize():void
        {
            var target:EnemyHBox;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _EnemyHBox_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_EnemyHBoxWatcherSetupUtil");
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

        public function __btnGlasss_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get btnRaving():Button
        {
            return (this._547606487btnRaving);
        }

        private function useSeek():void
        {
            _core.remote.useSeek(_obj.name);
        }

        [Bindable(event="propertyChange")]
        public function get btnEgg():Button
        {
            return (this._1378835447btnEgg);
        }

        private function _EnemyHBox_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ENEMYHBOX_S[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnGlasss.toolTip = _arg_1;
            }, "btnGlasss.toolTip");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ENEMYHBOX_S[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnSword.toolTip = _arg_1;
            }, "btnSword.toolTip");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ENEMYHBOX_S[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnEgg.toolTip = _arg_1;
            }, "btnEgg.toolTip");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ENEMYHBOX_S[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnRaving.toolTip = _arg_1;
            }, "btnRaving.toolTip");
            result[3] = binding;
            return (result);
        }

        public function set btnGlasss(_arg_1:Button):void
        {
            var _local_2:Object = this._242228723btnGlasss;
            if (_local_2 !== _arg_1)
            {
                this._242228723btnGlasss = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnGlasss", _local_2, _arg_1));
            };
        }

        private function clickHandler(_arg_1:MouseEvent):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:InputPanel;
            var _local_7:int;
            var _local_8:int;
            var _local_2:Button = Button(_arg_1.currentTarget);
            switch (_local_2.id)
            {
                case "btnGlasss":
                    _local_3 = _core.hasSeekNum();
                    if (_local_3 > 0)
                    {
                        useSeek();
                    }
                    else
                    {
                        _core.sysMidNote(Language.ENEMYHBOX_S[10]);
                    };
                    return;
                case "btnSword":
                    _local_4 = _core.hasTrackNum();
                    if (_local_4 > 0)
                    {
                        useTrack();
                    }
                    else
                    {
                        _core.sysMidNote(Language.ENEMYHBOX_S[11]);
                    };
                    return;
                case "btnEgg":
                    _local_5 = _core.hasEggNum();
                    if (_local_5 > 0)
                    {
                        _local_6 = InputPanel(_core.view.getUI(ViewManager.PANEL_INPUT));
                        _local_6.showInputNum(Language.ENEMYHBOX_S[9], "", useEgg, 1, 1, _local_5);
                    }
                    else
                    {
                        _core.sysMidNote(Language.ENEMYHBOX_S[8]);
                    };
                    return;
                case "btnRaving":
                    if (_local_2.styleName == "BtnRaving")
                    {
                        _local_7 = _core.hasRavingNum();
                        if (_local_7 > 0)
                        {
                            useRaving();
                        }
                        else
                        {
                            _core.sysMidNote(Language.ENEMYHBOX_S[12]);
                        };
                    }
                    else
                    {
                        if (_local_2.styleName == "BtnFlower")
                        {
                            _local_8 = _core.hasFlowerNum();
                            if (_local_8 > 0)
                            {
                                _local_6 = InputPanel(_core.view.getUI(ViewManager.PANEL_INPUT));
                                _local_6.showInputNum(Language.ENEMYHBOX_S[17], "", useFlower, 1, 1, _local_8);
                            }
                            else
                            {
                                _core.sysMidNote(Language.ENEMYHBOX_S[15]);
                            };
                        };
                    };
                    return;
            };
        }

        public function __btnSword_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function set obj(_arg_1:Object):void
        {
            _obj = _arg_1;
        }

        public function set btnRaving(_arg_1:Button):void
        {
            var _local_2:Object = this._547606487btnRaving;
            if (_local_2 !== _arg_1)
            {
                this._547606487btnRaving = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnRaving", _local_2, _arg_1));
            };
        }

        public function get obj():Object
        {
            return (_obj);
        }

        public function __btnEgg_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get btnGlasss():Button
        {
            return (this._242228723btnGlasss);
        }

        private function _EnemyHBox_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.ENEMYHBOX_S[4];
            _local_1 = Language.ENEMYHBOX_S[5];
            _local_1 = Language.ENEMYHBOX_S[6];
            _local_1 = Language.ENEMYHBOX_S[13];
        }

        public function set isFriend(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                btnRaving.styleName = "BtnFlower";
                btnRaving.toolTip = Language.ENEMYHBOX_S[14];
            };
        }

        private function useEgg(_arg_1:int):void
        {
            if (_arg_1 <= 0)
            {
                return;
            };
            if (_core.hasEggNum() >= _arg_1)
            {
                _core.remote.delPopNum(_obj.name, _arg_1);
            }
            else
            {
                _core.sysMidNote(Language.ENEMYHBOX_S[7]);
            };
        }


    }
}//package com.qeedoo.ui.view.comp

