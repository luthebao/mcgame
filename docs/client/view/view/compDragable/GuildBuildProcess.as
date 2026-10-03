// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.GuildBuildProcess

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.game.object.Building;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
    import mx.controls.Alert;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.CloseEvent;
    import com.qeedoo.game.data.GameData;
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

    public class GuildBuildProcess extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var requireStr:String = "";
        private var _476548482cancelBtn:BasicGlowButton;
        private var nextBuild:Object = null;
        public var _GuildBuildProcess_Label2:Label;
        private var _1724546052description:LinkTextArea;
        public var _GuildBuildProcess_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1401172455buildName:Label;
        public var _GuildBuildProcess_BasicGlowButton3:BasicGlowButton;
        private var _1095696741require:LinkTextArea;
        private var guild:Object = null;
        private var currentBuild:Building = null;
        private var _490944627buildImage:Image;
        private var _591318217finishBtn:BasicGlowButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":480,
                    "height":354,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_GuildBuildProcess_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":15,
                                "y":40,
                                "width":180,
                                "height":271,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"buildImage",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":17,
                                            "y":20,
                                            "width":45,
                                            "height":39
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"buildName",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":80,
                                            "y":10,
                                            "width":100
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                        this.right = "10";
                                        this.top = "80";
                                        this.bottom = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":LinkTextArea,
                                                "id":"description",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "8";
                                                    this.right = "8";
                                                    this.top = "8";
                                                    this.bottom = "8";
                                                    this.backgroundAlpha = 0;
                                                    this.color = 0xFFFFFF;
                                                    this.borderStyle = "none";
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_GuildBuildProcess_Label2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":200,
                                "y":60,
                                "width":53
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "260";
                            this.right = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":40,
                                "height":271,
                                "styleName":"RoundedGradientBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":LinkTextArea,
                                    "id":"require",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "8";
                                        this.right = "8";
                                        this.top = "8";
                                        this.bottom = "8";
                                        this.backgroundAlpha = 0;
                                        this.color = 0xFFFFFF;
                                        this.borderStyle = "none";
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"finishBtn",
                        "events":{"click":"__finishBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":16,
                                "y":314,
                                "width":56,
                                "styleName":"BtnStdRed"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"cancelBtn",
                        "events":{"click":"__cancelBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":103,
                                "y":314,
                                "width":56,
                                "styleName":"BtnStdRed"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_GuildBuildProcess_BasicGlowButton3",
                        "events":{"click":"___GuildBuildProcess_BasicGlowButton3_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":383,
                                "y":314,
                                "width":56,
                                "styleName":"BtnStdRed"
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

        public function GuildBuildProcess()
        {
            mx_internal::_document = this;
            this.width = 480;
            this.height = 354;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GuildBuildProcess._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get cancelBtn():BasicGlowButton
        {
            return (this._476548482cancelBtn);
        }

        private function _GuildBuildProcess_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.BUILD_S[7];
            _local_1 = Language.GUILDBUILDPROCESS_U[7];
            _local_1 = Language.GUILDBUILDPROCESS_U[8];
            _local_1 = Language.GUILDBUILDPROCESS_U[9];
            _local_1 = Language.GUILDBUILDPROCESS_U[10];
            _local_1 = Language.GUILDBUILDPROCESS_U[11];
        }

        public function set cancelBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._476548482cancelBtn;
            if (_local_2 !== _arg_1)
            {
                this._476548482cancelBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cancelBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get require():LinkTextArea
        {
            return (this._1095696741require);
        }

        [Bindable(event="propertyChange")]
        public function get description():LinkTextArea
        {
            return (this._1724546052description);
        }

        [Bindable(event="propertyChange")]
        public function get buildImage():Image
        {
            return (this._490944627buildImage);
        }

        public function set finishBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._591318217finishBtn;
            if (_local_2 !== _arg_1)
            {
                this._591318217finishBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finishBtn", _local_2, _arg_1));
            };
        }

        private function cancelBuild():void
        {
            Alert.show(Language.GUILDBUILDPROCESS_U[6], "", (Alert.YES | Alert.NO), null, handler);
        }

        override public function initialize():void
        {
            var target:GuildBuildProcess;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GuildBuildProcess_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_GuildBuildProcessWatcherSetupUtil");
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

        public function ___GuildBuildProcess_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            hide();
        }

        public function set buildImage(_arg_1:Image):void
        {
            var _local_2:Object = this._490944627buildImage;
            if (_local_2 !== _arg_1)
            {
                this._490944627buildImage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buildImage", _local_2, _arg_1));
            };
        }

        private function finishBuild():void
        {
            if (ToolKit.isEqual(currentBuild.tid, GamePredef.IN_BUILDING))
            {
                _core.remote.finishCreate(currentBuild.id);
            }
            else
            {
                _core.remote.finishUpgrade(currentBuild.id);
            };
            hide();
        }

        [Bindable(event="propertyChange")]
        public function get buildName():Label
        {
            return (this._1401172455buildName);
        }

        public function __cancelBtn_click(_arg_1:MouseEvent):void
        {
            cancelBuild();
        }

        public function __finishBtn_click(_arg_1:MouseEvent):void
        {
            finishBuild();
        }

        private function checkRequire():void
        {
            var _local_2:Object;
            var _local_1:* = "";
            requireStr = "";
            if (Number(nextBuild.moneyCost) > 0)
            {
                if (Number(guild.money) < Number(nextBuild.moneyCost))
                {
                    _local_1 = (((((("<font color='#FF0000'>" + "(") + guild.money) + "/") + nextBuild.moneyCost) + ")") + "</font>");
                }
                else
                {
                    _local_1 = (((("(" + guild.money) + "/") + nextBuild.moneyCost) + ")");
                };
                requireStr = (requireStr + ((("<br>" + Language.GUILDBUILDPROCESS_U[1]) + _local_1) + "</br>"));
            };
            if (Number(nextBuild.expCost) > 0)
            {
                if (Number(guild.exp) < Number(nextBuild.expCost))
                {
                    _local_1 = (((((("<font color='#FF0000'>" + "(") + guild.exp) + "/") + nextBuild.expCost) + ")") + "</font>");
                }
                else
                {
                    _local_1 = (((("(" + guild.exp) + "/") + nextBuild.expCost) + ")");
                };
                requireStr = (requireStr + ((("<br>" + Language.GUILDBUILDPROCESS_U[2]) + _local_1) + "</br>"));
            };
            if (Number(nextBuild.genMCost) > 0)
            {
                _local_2 = _core.getGuildItemNum(GamePredef.TBL_ITEM_TEMPLATE, GamePredef.GUILD_GENERAL_M).num;
                if (Number(_local_2) < Number(nextBuild.genMCost))
                {
                    _local_1 = (((((("<font color='#FF0000'>" + "(") + _local_2) + "/") + nextBuild.genMCost) + ")") + "</font>");
                }
                else
                {
                    _local_1 = (((("(" + _local_2) + "/") + nextBuild.genMCost) + ")");
                };
                requireStr = (requireStr + ((("<br>" + Language.GUILDBUILDPROCESS_U[3]) + _local_1) + "</br>"));
            };
            if (Number(nextBuild.rareMCost) > 0)
            {
                _local_2 = _core.getGuildItemNum(GamePredef.TBL_ITEM_TEMPLATE, GamePredef.GUILD_RARE_M).num;
                if (Number(_local_2) < Number(nextBuild.rareMCost))
                {
                    _local_1 = (((((("<font color='#FF0000'>" + "(") + _local_2) + "/") + nextBuild.rareMCost) + ")") + "</font>");
                }
                else
                {
                    _local_1 = (((("(" + _local_2) + "/") + nextBuild.rareMCost) + ")");
                };
                requireStr = (requireStr + ((("<br>" + Language.GUILDBUILDPROCESS_U[4]) + _local_1) + "</br>"));
            };
            if (Number(nextBuild.spMCost) > 0)
            {
                _local_2 = _core.getGuildItemNum(GamePredef.TBL_ITEM_TEMPLATE, GamePredef.GUILD_SPE_M).num;
                if (Number(_local_2) < Number(nextBuild.spMCost))
                {
                    _local_1 = (((((("<font color='#FF0000'>" + "(") + _local_2) + "/") + nextBuild.spMCost) + ")") + "</font>");
                }
                else
                {
                    _local_1 = (((("(" + _local_2) + "/") + nextBuild.spMCost) + ")");
                };
                requireStr = (requireStr + ((("<br>" + Language.GUILDBUILDPROCESS_U[5]) + _local_1) + "</br>"));
            };
            require.htmlText = (require.htmlText + requireStr);
        }

        public function set buildName(_arg_1:Label):void
        {
            var _local_2:Object = this._1401172455buildName;
            if (_local_2 !== _arg_1)
            {
                this._1401172455buildName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buildName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get finishBtn():BasicGlowButton
        {
            return (this._591318217finishBtn);
        }

        private function handler(_arg_1:CloseEvent):void
        {
            if (((!(_arg_1 == null)) && (_arg_1.detail == Alert.YES)))
            {
                _core.remote.call("resetConstruction", null, currentBuild.id);
            };
            hide();
        }

        private function checkBtnEnable():void
        {
            var _local_1:Object = _core.getGuildItemNum(GamePredef.TBL_ITEM_TEMPLATE, GamePredef.GUILD_GENERAL_M).num;
            var _local_2:Object = _core.getGuildItemNum(GamePredef.TBL_ITEM_TEMPLATE, GamePredef.GUILD_RARE_M).num;
            var _local_3:Object = _core.getGuildItemNum(GamePredef.TBL_ITEM_TEMPLATE, GamePredef.GUILD_SPE_M).num;
            if ((((((Number(guild.money) >= Number(nextBuild.moneyCost)) && (Number(guild.exp) >= Number(nextBuild.expCost))) && (Number(_local_1) >= Number(nextBuild.genMCost))) && (Number(_local_2) >= Number(nextBuild.rareMCost))) && (Number(_local_3) >= Number(nextBuild.spMCost))))
            {
                finishBtn.enabled = true;
            }
            else
            {
                finishBtn.enabled = false;
            };
        }

        public function set require(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._1095696741require;
            if (_local_2 !== _arg_1)
            {
                this._1095696741require = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "require", _local_2, _arg_1));
            };
        }

        private function _GuildBuildProcess_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BUILD_S[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildBuildProcess_BasicTitleCanvas1.text = _arg_1;
            }, "_GuildBuildProcess_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDBUILDPROCESS_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                buildName.text = _arg_1;
            }, "buildName.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDBUILDPROCESS_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildBuildProcess_Label2.text = _arg_1;
            }, "_GuildBuildProcess_Label2.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDBUILDPROCESS_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                finishBtn.label = _arg_1;
            }, "finishBtn.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDBUILDPROCESS_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                cancelBtn.label = _arg_1;
            }, "cancelBtn.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDBUILDPROCESS_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildBuildProcess_BasicGlowButton3.label = _arg_1;
            }, "_GuildBuildProcess_BasicGlowButton3.label");
            result[5] = binding;
            return (result);
        }

        public function showBuild(_arg_1:Object):void
        {
            currentBuild = (_arg_1 as Building);
            var _local_2:String = currentBuild.buildState;
            nextBuild = GameData.d[GamePredef.TBL_BUILDING][Number(_local_2)];
            buildImage.source = ResManager.getIconUrl(nextBuild.iconCode);
            buildName.text = nextBuild.name;
            description.text = nextBuild.description;
            guild = _core.player.guild;
            if (guild == null)
            {
                Alert.show(Language.GUILDBUILDPROCESS_U[0], "");
                return;
            };
            require.htmlText = "";
            checkRequire();
            checkBtnEnable();
            show();
        }

        public function set description(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._1724546052description;
            if (_local_2 !== _arg_1)
            {
                this._1724546052description = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "description", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

