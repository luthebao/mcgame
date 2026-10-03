// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.CrossTeamFightResultInfo

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.collections.ArrayCollection;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.net.Responder;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.view.compDragable.CrossTeamFightPanel;
    import com.qeedoo.ui.resource.ResManager;
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

    public class CrossTeamFightResultInfo extends Canvas implements IBindingClient 
    {

        private static var arr:Object = {
            "8":[4, 0],
            "9":[4, 1],
            "10":[4, 2],
            "11":[4, 3],
            "12":[3, 0],
            "13":[3, 1],
            "14":[2, 0]
        };
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _112797rep:BasicDelayButton;
        private var _746483037areaTxt:Label;
        private var _data:Object;
        private var rid:String = "";
        private var _3469809rImg:Image;
        private var _104387img:Image;
        private var _index:int = -1;
        private var _1721941989nameTxt:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":146,
                    "height":65,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":146,
                                "height":46,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"nameTxt",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "3";
                                        this.top = "4";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":160});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"areaTxt",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "3";
                                        this.bottom = "4";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":160});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"rImg",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":100,
                                            "y":0
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicDelayButton,
                        "id":"rep",
                        "events":{"click":"__rep_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":false,
                                "styleName":"BtnNormalRed",
                                "height":24,
                                "x":0,
                                "y":43
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"img",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":90,
                                "y":35,
                                "visible":false
                            });
                        }
                    })]
                });
            }
        });
        private var _469523524repArray:ArrayCollection = new ArrayCollection();
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function CrossTeamFightResultInfo()
        {
            mx_internal::_document = this;
            this.width = 146;
            this.height = 65;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.addEventListener("creationComplete", ___CrossTeamFightResultInfo_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CrossTeamFightResultInfo._watcherSetupUtil = _arg_1;
        }


        private function toLookRep():void
        {
            if (rid)
            {
                _core.remote.call("applyReplayInfoByBid", new Responder(onLookRep), rid);
            };
        }

        public function __rep_click(_arg_1:MouseEvent):void
        {
            toLookRep();
        }

        override public function initialize():void
        {
            var target:CrossTeamFightResultInfo;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CrossTeamFightResultInfo_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_CrossTeamFightResultInfoWatcherSetupUtil");
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

        public function set img(_arg_1:Image):void
        {
            var _local_2:Object = this._104387img;
            if (_local_2 !== _arg_1)
            {
                this._104387img = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get rep():BasicDelayButton
        {
            return (this._112797rep);
        }

        public function init():void
        {
            nameTxt.text = "";
            areaTxt.text = "";
            rep.visible = false;
            rImg.source = "";
            _data = null;
        }

        [Bindable(event="propertyChange")]
        public function get areaTxt():Label
        {
            return (this._746483037areaTxt);
        }

        public function set index(_arg_1:int):void
        {
            _index = _arg_1;
        }

        private function onLookRep(_arg_1:Object):void
        {
        }

        [Bindable(event="propertyChange")]
        private function get repArray():ArrayCollection
        {
            return (this._469523524repArray);
        }

        public function ___CrossTeamFightResultInfo_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set rep(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._112797rep;
            if (_local_2 !== _arg_1)
            {
                this._112797rep = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rep", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get img():Image
        {
            return (this._104387img);
        }

        public function set areaTxt(_arg_1:Label):void
        {
            var _local_2:Object = this._746483037areaTxt;
            if (_local_2 !== _arg_1)
            {
                this._746483037areaTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "areaTxt", _local_2, _arg_1));
            };
        }

        public function set nameTxt(_arg_1:Label):void
        {
            var _local_2:Object = this._1721941989nameTxt;
            if (_local_2 !== _arg_1)
            {
                this._1721941989nameTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameTxt", _local_2, _arg_1));
            };
        }

        public function refresh(_arg_1:Object, _arg_2:Object):void
        {
            _data = _arg_1;
            if (!_arg_1)
            {
                return;
            };
            var _local_3:int;
            var _local_4:Object;
            var _local_5:Object;
            if (_index == 14)
            {
                if (!_data.team1)
                {
                    _local_4 = _data.team2;
                }
                else
                {
                    if (!_data.team2)
                    {
                        _local_4 = _data.team1;
                    }
                    else
                    {
                        _local_4 = ((_data.win == _data.team1.leaderId) ? _data.team1 : _data.team2);
                        _local_5 = ((_data.win != _data.team1.leaderId) ? _data.team1 : _data.team2);
                    };
                };
            }
            else
            {
                if ((_index % 2) == 0)
                {
                    _local_4 = _data.team1;
                    _local_5 = _data.team2;
                }
                else
                {
                    _local_4 = _data.team2;
                    _local_5 = _data.team1;
                };
            };
            if (!_local_4)
            {
                return;
            };
            nameTxt.text = (Language.CROSS_FIGHT_PANEL_U[52] + _local_4.teamName);
            areaTxt.text = (Language.CROSS_FIGHT_PANEL_U[25] + _local_4.area);
            var _local_6:int = CrossTeamFightPanel.TEAM_CROSSPK_STATE;
            if (((_data.status == 4) && (!(_arg_1.win))))
            {
                rImg.source = ResManager.getIconUrl(4130220000281);
            }
            else
            {
                if ((((_local_5) && (_data.status == 4)) && (Number(_local_5.leaderId) == _arg_1.win)))
                {
                    rImg.source = ResManager.getIconUrl(4130220000281);
                }
                else
                {
                    if (!_local_5)
                    {
                        if (_index == 14)
                        {
                            rImg.source = ResManager.getIconUrl(4130220000282);
                        }
                        else
                        {
                            rImg.source = ResManager.getIconUrl(4130220000280);
                        };
                    }
                    else
                    {
                        if (Number(_local_4.leaderId) == _arg_1.win)
                        {
                            if (_index == 14)
                            {
                                if (CrossTeamFightPanel.TEAM_CROSSPK_GROUP == CrossTeamFightPanel.tabSelect)
                                {
                                    if (((_local_6 == 1) || (_local_6 > 5)))
                                    {
                                        rImg.source = ResManager.getIconUrl(4130220000279);
                                    }
                                    else
                                    {
                                        rImg.source = ResManager.getIconUrl(4130220000282);
                                    };
                                }
                                else
                                {
                                    rImg.source = ResManager.getIconUrl(4130220000279);
                                };
                            }
                            else
                            {
                                rImg.source = ResManager.getIconUrl(4130220000226);
                            };
                        }
                        else
                        {
                            if (((_local_5) && (Number(_local_5.leaderId) == _arg_1.win)))
                            {
                                if (CrossTeamFightPanel.TEAM_CROSSPK_GROUP == CrossTeamFightPanel.tabSelect)
                                {
                                    if ((((_local_6 <= 5) && (_local_6 > 2)) && ((_index == 13) || (_index == 12))))
                                    {
                                        rImg.source = ResManager.getIconUrl(4130220000282);
                                    }
                                    else
                                    {
                                        rImg.source = ResManager.getIconUrl(4130220000227);
                                    };
                                }
                                else
                                {
                                    rImg.source = ResManager.getIconUrl(4130220000227);
                                };
                            }
                            else
                            {
                                rImg.source = null;
                            };
                        };
                    };
                };
            };
            if (CrossTeamFightPanel.TEAM_CROSSPK_GROUP == CrossTeamFightPanel.tabSelect)
            {
                if (((_local_6 <= 5) || (!(_arg_2))))
                {
                    rep.visible = false;
                    return;
                };
            };
            var _local_7:Array = arr[_index];
            if ((((((_local_7) && (_arg_2)) && (_arg_2[_local_7[0]])) && (_arg_2[_local_7[0]][_local_7[1]])) && (_arg_2[_local_7[0]][_local_7[1]].rid)))
            {
                rid = _arg_2[_local_7[0]][_local_7[1]].rid.toString();
                rep.visible = true;
            }
            else
            {
                rep.visible = false;
            };
        }

        public function set rImg(_arg_1:Image):void
        {
            var _local_2:Object = this._3469809rImg;
            if (_local_2 !== _arg_1)
            {
                this._3469809rImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rImg", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get nameTxt():Label
        {
            return (this._1721941989nameTxt);
        }

        private function getReps():void
        {
            var _local_1:String;
            var _local_2:Array;
            var _local_3:int;
            repArray.removeAll();
            if ((((_data) && (_data.rid)) && (_data.rid.toString().length > 0)))
            {
                _local_1 = _data.rid;
                _local_2 = _local_1.split("#");
                _local_3 = 0;
                while (_local_3 < _local_2.length)
                {
                    repArray.addItem({
                        "label":((Language.CROSS_FIGHT_PANEL_U[56] + Language.GAMEPREDEF_S[(544 + _local_3)]) + Language.CROSS_FIGHT_PANEL_U[57]),
                        "data":_local_2[_local_3]
                    });
                    _local_3++;
                };
            };
        }

        private function _CrossTeamFightResultInfo_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rep.label = _arg_1;
            }, "rep.label");
            result[0] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get rImg():Image
        {
            return (this._3469809rImg);
        }

        private function set repArray(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._469523524repArray;
            if (_local_2 !== _arg_1)
            {
                this._469523524repArray = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "repArray", _local_2, _arg_1));
            };
        }

        private function _CrossTeamFightResultInfo_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[14];
        }


    }
}//package com.qeedoo.ui.view.comp

