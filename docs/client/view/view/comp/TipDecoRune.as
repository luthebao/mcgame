// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipDecoRune

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.core.IToolTip;
    import com.qeedoo.game.config.Language;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.containers.VBox;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.ResizeEvent;
    import mx.events.PropertyChangeEvent;
    import mx.binding.Binding;
    import flash.utils.getDefinitionByName;
    import flash.display.DisplayObject;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
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

    public class TipDecoRune extends BasicToolTip implements IBindingClient, IToolTip 
    {

        public static const QUL_COLOR:Object = {
            "1":"#FFFFFF",
            "2":"#00FF00",
            "3":"#0000FF",
            "4":"#9900FF",
            "5":"#FF6633",
            "6":"#FF0000"
        };
        public static const RUNE_KIND:Object = {
            "1":Language.DECORATE_PANEL[80][0],
            "2":Language.DECORATE_PANEL[80][1]
        };
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _100893exp:Label;
        public var _TipDecoRune_Label6:Label;
        private var _107554lvl:Label;
        private var _1125939651curProp:Label;
        private var _111458690upExp:Label;
        private var _3292052kind:Label;
        private var _410956671container:VBox;
        private var _obj:Object;
        private var _820533477runeName:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":BasicToolTip,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":VBox,
                        "id":"container",
                        "propertiesFactory":function ():Object
                        {
                            return ({"childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"runeName"
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"lvl",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"upExp"
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"exp"
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"kind"
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_TipDecoRune_Label6"
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"curProp",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF;
                                    }
                                })]});
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TipDecoRune()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasToolTip";
            this.addEventListener("resize", ___TipDecoRune_BasicToolTip1_resize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipDecoRune._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get container():VBox
        {
            return (this._410956671container);
        }

        public function ___TipDecoRune_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
        }

        [Bindable(event="propertyChange")]
        public function get curProp():Label
        {
            return (this._1125939651curProp);
        }

        public function set curProp(_arg_1:Label):void
        {
            var _local_2:Object = this._1125939651curProp;
            if (_local_2 !== _arg_1)
            {
                this._1125939651curProp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curProp", _local_2, _arg_1));
            };
        }

        public function set container(_arg_1:VBox):void
        {
            var _local_2:Object = this._410956671container;
            if (_local_2 !== _arg_1)
            {
                this._410956671container = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "container", _local_2, _arg_1));
            };
        }

        private function _TipDecoRune_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPDECO_S[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipDecoRune_Label6.text = _arg_1;
            }, "_TipDecoRune_Label6.text");
            result[0] = binding;
            return (result);
        }

        override public function initialize():void
        {
            var target:TipDecoRune;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipDecoRune_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipDecoRuneWatcherSetupUtil");
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

        public function set runeName(_arg_1:Label):void
        {
            var _local_2:Object = this._820533477runeName;
            if (_local_2 !== _arg_1)
            {
                this._820533477runeName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "runeName", _local_2, _arg_1));
            };
        }

        public function set exp(_arg_1:Label):void
        {
            var _local_2:Object = this._100893exp;
            if (_local_2 !== _arg_1)
            {
                this._100893exp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "exp", _local_2, _arg_1));
            };
        }

        public function set lvl(_arg_1:Label):void
        {
            var _local_2:Object = this._107554lvl;
            if (_local_2 !== _arg_1)
            {
                this._107554lvl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lvl", _local_2, _arg_1));
            };
        }

        private function setTemp(_arg_1:Object):void
        {
            var _local_12:Object;
            var _local_13:int;
            var _local_14:int;
            var _local_15:int;
            var _local_16:Label;
            var _local_17:Label;
            var _local_2:Object = _arg_1["temp"];
            var _local_3:int = _local_2["qulity"];
            var _local_4:int = _local_2["level"];
            var _local_5:int = _local_2["type"];
            var _local_6:int = _local_2["propNum"];
            var _local_7:int = _local_2["per"];
            var _local_8:String = QUL_COLOR[_local_3];
            runeName.setStyle("color", _local_8);
            runeName.text = _local_2["name"];
            lvl.text = Language.TIPDECO_S[12].toString().replace("{num}", _local_4);
            upExp.text = Language.TIPDECO_S[9].toString().replace("{num}", _local_2["upExp"]);
            exp.text = Language.TIPDECO_S[10].toString().replace("{num}", _local_2["exp"]);
            kind.htmlText = (((Language.TIPDECO_S[11] + "<font color='#00FFFF'>") + RUNE_KIND[_local_2["kind"]]) + "</font>");
            switch (_local_5)
            {
                case 1:
                case 4:
                case 5:
                case 6:
                case 7:
                case 11:
                    curProp.text = (Language.TIPPROP_S[_local_5] + _local_6);
                    break;
                case 8:
                case 9:
                case 13:
                case 14:
                case 31:
                case 32:
                case 58:
                case 61:
                    curProp.text = (Language.TIPPROP_S[_local_5] + (_local_6 / 10000));
                    break;
                case 34:
                case 59:
                case 60:
                case 62:
                case 63:
                case 71:
                    curProp.text = ((Language.TIPPROP_S[_local_5] + (_local_6 / 100)) + "%");
                    break;
            };
            var _local_9:DisplayObject = container.getChildByName("label");
            var _local_10:DisplayObject = container.getChildByName("label2");
            if (_local_9)
            {
                container.removeChild(_local_9);
            };
            if (_local_10)
            {
                container.removeChild(_local_10);
            };
            var _local_11:int = _local_2["nextId"];
            if (_local_11)
            {
                _local_12 = GameData.d[GamePredef.TBL_DECO_RUNE][_local_11];
                _local_13 = _local_12["type"];
                _local_14 = _local_12["propNum"];
                _local_15 = _local_12["per"];
                _local_16 = new Label();
                _local_16.name = "label";
                _local_16.text = Language.TIPDECO_S[8];
                _local_17 = new Label();
                _local_17.name = "label2";
                _local_17.setStyle("color", "#00FFFF");
                switch (_local_13)
                {
                    case 1:
                    case 4:
                    case 5:
                    case 6:
                    case 7:
                    case 11:
                        _local_17.text = (Language.TIPPROP_S[_local_13] + _local_14);
                        break;
                    case 8:
                    case 9:
                    case 13:
                    case 14:
                    case 31:
                    case 32:
                    case 58:
                    case 61:
                        _local_17.text = (Language.TIPPROP_S[_local_13] + (_local_14 / 10000));
                        break;
                    case 34:
                    case 59:
                    case 60:
                    case 62:
                    case 63:
                    case 71:
                        _local_17.text = ((Language.TIPPROP_S[_local_13] + (_local_14 / 100)) + "%");
                        break;
                };
                container.addChild(_local_16);
                container.addChild(_local_17);
            };
        }

        [Bindable(event="propertyChange")]
        public function get lvl():Label
        {
            return (this._107554lvl);
        }

        [Bindable(event="propertyChange")]
        public function get kind():Label
        {
            return (this._3292052kind);
        }

        [Bindable(event="propertyChange")]
        public function get exp():Label
        {
            return (this._100893exp);
        }

        [Bindable(event="propertyChange")]
        public function get runeName():Label
        {
            return (this._820533477runeName);
        }

        public function set upExp(_arg_1:Label):void
        {
            var _local_2:Object = this._111458690upExp;
            if (_local_2 !== _arg_1)
            {
                this._111458690upExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upExp", _local_2, _arg_1));
            };
        }

        public function set kind(_arg_1:Label):void
        {
            var _local_2:Object = this._3292052kind;
            if (_local_2 !== _arg_1)
            {
                this._3292052kind = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "kind", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get upExp():Label
        {
            return (this._111458690upExp);
        }

        private function _TipDecoRune_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.TIPDECO_S[7];
        }

        public function set object(_arg_1:Object):void
        {
            _obj = _arg_1;
            if (!_arg_1.temp)
            {
                return;
            };
            setTemp(_arg_1);
        }


    }
}//package com.qeedoo.ui.view.comp

