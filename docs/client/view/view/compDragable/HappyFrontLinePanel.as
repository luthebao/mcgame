// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.HappyFrontLinePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.controls.Image;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Text;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.controls.Button;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import mx.binding.Binding;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import flash.utils.getDefinitionByName;
    import flash.net.Responder;
    import com.qeedoo.game.utils.TimeUtil;
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

    public class HappyFrontLinePanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1178662793item15:ItemSlot;
        public var _HappyFrontLinePanel_Image1:Image;
        private var _100525953item4:ItemSlot;
        private var _102850829left4:Image;
        private var _1106591637left15:Image;
        private var _1106591609left22:Image;
        private var _808329852vsFlop:ViewStack;
        private var _1200599363right18:Image;
        private var _102850826left1:Image;
        private var _100525950item1:ItemSlot;
        private var _1106591640left12:Image;
        private var _1178662798item10:ItemSlot;
        private var _102850834left9:Image;
        private var _102850831left6:Image;
        private var _1106591634left18:Image;
        private var _1106591606left25:Image;
        private var _1200599361right16:Image;
        private var _1982093501oneItem6:ItemSlot;
        private var _1982093503oneItem8:ItemSlot;
        private var _931102313right3:Image;
        private var _1200599359right14:Image;
        private var _1178662795item13:ItemSlot;
        private var lightGridNum:Number = 0;
        private var _1034521339lltOneItem:ItemSlot;
        private var _100525957item8:ItemSlot;
        private var _931102307right9:Image;
        private var _1106591639left13:Image;
        private var _1200599388right22:Image;
        private var _1200599357right12:Image;
        private var _1200599390right24:Image;
        private var _100525954item5:ItemSlot;
        private var _931102310right6:Image;
        private var _1106591642left10:Image;
        private var _1178662792item16:ItemSlot;
        private var _1863324756bangBtn0:BasicGlowButton;
        private var _1982093496oneItem1:ItemSlot;
        private var _1982093498oneItem3:ItemSlot;
        private var _102850827left2:Image;
        private var _100525951item2:ItemSlot;
        private var _2075718404leftResult:Image;
        private var _1106591636left16:Image;
        private var _1106591608left23:Image;
        private var _1200599386right20:Image;
        private var _931102315right1:Image;
        private var _1106591611left20:Image;
        private var _1200599355right10:Image;
        private var _1178662797item11:ItemSlot;
        private var _102850832left7:Image;
        private var _1200599364right19:Image;
        private var _931102309right7:Image;
        private var _1106591633left19:Image;
        private var _100525958item9:ItemSlot;
        private var _931102312right4:Image;
        private var _1178662794item14:ItemSlot;
        private var _1200599362right17:Image;
        private var _100525955item6:ItemSlot;
        private var _1106591638left14:Image;
        private var _1982093500oneItem5:ItemSlot;
        private var _102850828left3:Image;
        private var _100525952item3:ItemSlot;
        private var _1106591641left11:Image;
        private var _453021351rightResult:Image;
        public var _HappyFrontLinePanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1982093502oneItem7:ItemSlot;
        private var _1200599358right13:Image;
        private var _1200599389right23:Image;
        private var _1982093504oneItem9:ItemSlot;
        private var _1200599391right25:Image;
        private var _1200599360right15:Image;
        private var _102850833left8:Image;
        private var _1106591635left17:Image;
        private var _1106591607left24:Image;
        private var _98712998guize:Text;
        private var _931102314right2:Image;
        private var _1106591610left21:Image;
        private var _1178662796item12:ItemSlot;
        private var _102850830left5:Image;
        private var _1863324755bangBtn1:BasicGlowButton;
        private var _1200599356right11:Image;
        private var _1982093495oneItem0:ItemSlot;
        private var _1982093497oneItem2:ItemSlot;
        private var _1200599387right21:Image;
        private var _1982093499oneItem4:ItemSlot;
        private var _931102308right8:Image;
        private var _931102311right5:Image;
        private var _100525956item7:ItemSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":670,
                    "height":537,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_HappyFrontLinePanel_BasicTitleCanvas1",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 14;
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"bangBtn0",
                        "events":{"click":"__bangBtn0_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "selected":true,
                                "labelPlacement":"bottom",
                                "width":70,
                                "x":20,
                                "y":33
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"bangBtn1",
                        "events":{"click":"__bangBtn1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "width":70,
                                "x":89,
                                "y":33
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"vsFlop",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":53,
                                "width":650,
                                "height":470,
                                "creationPolicy":"all",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "label":"Hornor",
                                            "y":53,
                                            "width":650,
                                            "height":470,
                                            "x":10,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_HappyFrontLinePanel_Image1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "x":10,
                                                        "y":10,
                                                        "width":330,
                                                        "height":450,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"oneItem0",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":36,
                                                                    "y":152.5,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"oneItem1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":36,
                                                                    "y":193.5,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"oneItem2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":36,
                                                                    "y":236.5,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"oneItem3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":36,
                                                                    "y":277.5,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"oneItem4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":36,
                                                                    "y":319,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"oneItem5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":82,
                                                                    "y":361,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"oneItem6",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":127,
                                                                    "y":361,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"oneItem7",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":171,
                                                                    "y":361,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"oneItem8",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":216,
                                                                    "y":361,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"oneItem9",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":261,
                                                                    "y":361,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___HappyFrontLinePanel_Button1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":30,
                                                                    "y":356,
                                                                    "styleName":"happyFrontLineFresh",
                                                                    "height":43,
                                                                    "width":44
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___HappyFrontLinePanel_Button2_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":46,
                                                                    "y":100,
                                                                    "label":"随机开启",
                                                                    "width":115,
                                                                    "styleName":"BtnStdRed",
                                                                    "height":22
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___HappyFrontLinePanel_Button3_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":46,
                                                                    "y":125,
                                                                    "label":"开启奇数",
                                                                    "width":115,
                                                                    "styleName":"BtnStdRed",
                                                                    "height":22
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___HappyFrontLinePanel_Button4_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":169,
                                                                    "y":100,
                                                                    "label":"精确开启",
                                                                    "width":115,
                                                                    "styleName":"BtnStdRed",
                                                                    "height":22
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___HappyFrontLinePanel_Button5_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":169,
                                                                    "y":125,
                                                                    "label":"开启偶数",
                                                                    "width":115,
                                                                    "styleName":"BtnStdRed",
                                                                    "height":22
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"left1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":82,
                                                                    "y":159,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"right1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":99,
                                                                    "y":159,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"left2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":127,
                                                                    "y":159,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"right2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":144,
                                                                    "y":159,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"left3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":171,
                                                                    "y":159,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"right3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":188,
                                                                    "y":159,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"left4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":216,
                                                                    "y":159,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"right4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":233,
                                                                    "y":159,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"left5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":261,
                                                                    "y":159,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"right5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":278,
                                                                    "y":159,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"left6",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":82,
                                                                    "y":201,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"right6",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":99,
                                                                    "y":201,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"left7",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":127,
                                                                    "y":201,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"right7",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":144,
                                                                    "y":201,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"left8",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":171,
                                                                    "y":201,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"right8",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":188,
                                                                    "y":201,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"left9",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":216,
                                                                    "y":201,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"right9",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":233,
                                                                    "y":201,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"left10",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":261,
                                                                    "y":201,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"right10",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":278,
                                                                    "y":201,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"left11",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":82,
                                                                    "y":243,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"right11",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":99,
                                                                    "y":243,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"left12",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":127,
                                                                    "y":243,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"right12",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":144,
                                                                    "y":243,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"left13",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":171,
                                                                    "y":243,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"right13",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":188,
                                                                    "y":243,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"left14",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":216,
                                                                    "y":243,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"right14",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":233,
                                                                    "y":243,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"left15",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":261,
                                                                    "y":243,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"right15",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":278,
                                                                    "y":243,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"left16",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":82,
                                                                    "y":285,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"right16",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":99,
                                                                    "y":285,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"left17",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":127,
                                                                    "y":285,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"right17",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":144,
                                                                    "y":285,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"left18",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":171,
                                                                    "y":285,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"right18",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":188,
                                                                    "y":285,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"left19",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":216,
                                                                    "y":285,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"right19",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":233,
                                                                    "y":285,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"left20",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":261,
                                                                    "y":285,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"right20",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":278,
                                                                    "y":285,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"left21",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":82,
                                                                    "y":327,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"right21",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":99,
                                                                    "y":327,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"left22",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":127,
                                                                    "y":327,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"right22",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":144,
                                                                    "y":327,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"left23",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":171,
                                                                    "y":327,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"right23",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":188,
                                                                    "y":327,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"left24",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":216,
                                                                    "y":327,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"right24",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":233,
                                                                    "y":327,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"left25",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":261,
                                                                    "y":327,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"right25",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":278,
                                                                    "y":327,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"leftResult",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":148,
                                                                    "y":45,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"rightResult",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":165,
                                                                    "y":45,
                                                                    "height":34,
                                                                    "width":17
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "x":350,
                                                        "y":10,
                                                        "width":290,
                                                        "height":168,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___HappyFrontLinePanel_Button6_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":113,
                                                                    "y":136,
                                                                    "label":"LMới",
                                                                    "styleName":"BtnStdRed",
                                                                    "width":64,
                                                                    "height":25
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"lltOneItem",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":128,
                                                                    "y":74,
                                                                    "movable":false
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "x":348,
                                                        "y":186,
                                                        "width":292,
                                                        "height":274,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"item1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":60,
                                                                    "y":54,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"item2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":106,
                                                                    "y":54,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"item3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":152,
                                                                    "y":54,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"item4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":198,
                                                                    "y":54,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"item5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":60,
                                                                    "y":98,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"item6",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":106,
                                                                    "y":98,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"item7",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":152,
                                                                    "y":98,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"item8",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":198,
                                                                    "y":98,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"item9",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":60,
                                                                    "y":142,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"item10",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":106,
                                                                    "y":142,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"item11",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":152,
                                                                    "y":142,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"item12",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":198,
                                                                    "y":142,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"item13",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":60,
                                                                    "y":186,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"item14",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":106,
                                                                    "y":186,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"item15",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":152,
                                                                    "y":186,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"item16",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":198,
                                                                    "y":186,
                                                                    "movable":false
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "label":"Hornor",
                                            "y":53,
                                            "width":650,
                                            "height":470,
                                            "x":10,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"guize",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.fontSize = 14;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":11,
                                                        "width":630,
                                                        "height":449
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
        private var happyFrontLineConf:Object = {};
        private var happyFrontLineData:Object = {};
        private var _core:Core = Core.getInstance();
        private var resLightArr:Array = [4130220000697, 4130220000698, 4130220000699, 4130220000700, 4130220000701, 4130220000702, 4130220000703, 4130220000704, 4130220000705, 4130220000706];
        private var resDarkArr:Array = [4130220000797, 4130220000798, 4130220000799, 4130220000800, 4130220000801, 4130220000802, 4130220000803, 4130220000804, 4130220000805, 4130220000806];
        private var happyFrontLineOneItemObj:Object = {};
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function HappyFrontLinePanel()
        {
            mx_internal::_document = this;
            this.width = 670;
            this.height = 537;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.x = 103;
            this.y = 102;
            this.addEventListener("creationComplete", ___HappyFrontLinePanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            HappyFrontLinePanel._watcherSetupUtil = _arg_1;
        }


        public function set leftResult(_arg_1:Image):void
        {
            var _local_2:Object = this._2075718404leftResult;
            if (_local_2 !== _arg_1)
            {
                this._2075718404leftResult = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leftResult", _local_2, _arg_1));
            };
        }

        public function set lltOneItem(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1034521339lltOneItem;
            if (_local_2 !== _arg_1)
            {
                this._1034521339lltOneItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lltOneItem", _local_2, _arg_1));
            };
        }

        public function onHappyFrontLineFresh(_arg_1:Number):void
        {
            lltOneItem.type = GamePredef.TBL_ITEM_TEMPLATE;
            lltOneItem.giid = _arg_1;
            lltOneItem.slotData = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_arg_1];
        }

        public function set left2(_arg_1:Image):void
        {
            var _local_2:Object = this._102850827left2;
            if (_local_2 !== _arg_1)
            {
                this._102850827left2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left2", _local_2, _arg_1));
            };
        }

        public function set left3(_arg_1:Image):void
        {
            var _local_2:Object = this._102850828left3;
            if (_local_2 !== _arg_1)
            {
                this._102850828left3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left3", _local_2, _arg_1));
            };
        }

        public function set left1(_arg_1:Image):void
        {
            var _local_2:Object = this._102850826left1;
            if (_local_2 !== _arg_1)
            {
                this._102850826left1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left1", _local_2, _arg_1));
            };
        }

        public function set left5(_arg_1:Image):void
        {
            var _local_2:Object = this._102850830left5;
            if (_local_2 !== _arg_1)
            {
                this._102850830left5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left5", _local_2, _arg_1));
            };
        }

        private function _HappyFrontLinePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.HAPPY_FRONT_LINE[0];
            _local_1 = Language.HAPPY_FRONT_LINE[2];
            _local_1 = Language.HAPPY_FRONT_LINE[3];
            _local_1 = ResManager.getIconUrl(4130220000695);
            _local_1 = Language.HAPPY_FRONT_LINE[10];
        }

        public function set left8(_arg_1:Image):void
        {
            var _local_2:Object = this._102850833left8;
            if (_local_2 !== _arg_1)
            {
                this._102850833left8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left8", _local_2, _arg_1));
            };
        }

        public function set left9(_arg_1:Image):void
        {
            var _local_2:Object = this._102850834left9;
            if (_local_2 !== _arg_1)
            {
                this._102850834left9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left9", _local_2, _arg_1));
            };
        }

        public function set left6(_arg_1:Image):void
        {
            var _local_2:Object = this._102850831left6;
            if (_local_2 !== _arg_1)
            {
                this._102850831left6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left6", _local_2, _arg_1));
            };
        }

        public function set left4(_arg_1:Image):void
        {
            var _local_2:Object = this._102850829left4;
            if (_local_2 !== _arg_1)
            {
                this._102850829left4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left4", _local_2, _arg_1));
            };
        }

        public function set left7(_arg_1:Image):void
        {
            var _local_2:Object = this._102850832left7;
            if (_local_2 !== _arg_1)
            {
                this._102850832left7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left7", _local_2, _arg_1));
            };
        }

        public function __bangBtn1_click(_arg_1:MouseEvent):void
        {
            changeView(1);
        }

        [Bindable(event="propertyChange")]
        public function get left10():Image
        {
            return (this._1106591642left10);
        }

        [Bindable(event="propertyChange")]
        public function get left13():Image
        {
            return (this._1106591639left13);
        }

        [Bindable(event="propertyChange")]
        public function get left15():Image
        {
            return (this._1106591637left15);
        }

        [Bindable(event="propertyChange")]
        public function get left17():Image
        {
            return (this._1106591635left17);
        }

        [Bindable(event="propertyChange")]
        public function get left12():Image
        {
            return (this._1106591640left12);
        }

        [Bindable(event="propertyChange")]
        public function get item10():ItemSlot
        {
            return (this._1178662798item10);
        }

        public function ___HappyFrontLinePanel_Button4_click(_arg_1:MouseEvent):void
        {
            playHappyFrontLine(2);
        }

        [Bindable(event="propertyChange")]
        public function get item15():ItemSlot
        {
            return (this._1178662793item15);
        }

        [Bindable(event="propertyChange")]
        public function get item16():ItemSlot
        {
            return (this._1178662792item16);
        }

        [Bindable(event="propertyChange")]
        public function get item11():ItemSlot
        {
            return (this._1178662797item11);
        }

        [Bindable(event="propertyChange")]
        public function get item12():ItemSlot
        {
            return (this._1178662796item12);
        }

        private function changeView(_arg_1:Number):void
        {
            vsFlop.selectedIndex = _arg_1;
            var _local_2:int;
            while (_local_2 < 2)
            {
                this[("bangBtn" + _local_2)].selected = false;
                _local_2++;
            };
            this[("bangBtn" + _arg_1)].selected = true;
        }

        [Bindable(event="propertyChange")]
        public function get left11():Image
        {
            return (this._1106591641left11);
        }

        public function set right15(_arg_1:Image):void
        {
            var _local_2:Object = this._1200599360right15;
            if (_local_2 !== _arg_1)
            {
                this._1200599360right15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right15", _local_2, _arg_1));
            };
        }

        public function set right12(_arg_1:Image):void
        {
            var _local_2:Object = this._1200599357right12;
            if (_local_2 !== _arg_1)
            {
                this._1200599357right12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right12", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get left14():Image
        {
            return (this._1106591638left14);
        }

        public function set right13(_arg_1:Image):void
        {
            var _local_2:Object = this._1200599358right13;
            if (_local_2 !== _arg_1)
            {
                this._1200599358right13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right13", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get item13():ItemSlot
        {
            return (this._1178662795item13);
        }

        [Bindable(event="propertyChange")]
        public function get item14():ItemSlot
        {
            return (this._1178662794item14);
        }

        [Bindable(event="propertyChange")]
        public function get left18():Image
        {
            return (this._1106591634left18);
        }

        [Bindable(event="propertyChange")]
        public function get left19():Image
        {
            return (this._1106591633left19);
        }

        [Bindable(event="propertyChange")]
        public function get left23():Image
        {
            return (this._1106591608left23);
        }

        [Bindable(event="propertyChange")]
        public function get left25():Image
        {
            return (this._1106591606left25);
        }

        public function set right17(_arg_1:Image):void
        {
            var _local_2:Object = this._1200599362right17;
            if (_local_2 !== _arg_1)
            {
                this._1200599362right17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right17", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get left20():Image
        {
            return (this._1106591611left20);
        }

        [Bindable(event="propertyChange")]
        public function get left21():Image
        {
            return (this._1106591610left21);
        }

        [Bindable(event="propertyChange")]
        public function get left16():Image
        {
            return (this._1106591636left16);
        }

        public function set right19(_arg_1:Image):void
        {
            var _local_2:Object = this._1200599364right19;
            if (_local_2 !== _arg_1)
            {
                this._1200599364right19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right19", _local_2, _arg_1));
            };
        }

        public function set right16(_arg_1:Image):void
        {
            var _local_2:Object = this._1200599361right16;
            if (_local_2 !== _arg_1)
            {
                this._1200599361right16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right16", _local_2, _arg_1));
            };
        }

        public function set right18(_arg_1:Image):void
        {
            var _local_2:Object = this._1200599363right18;
            if (_local_2 !== _arg_1)
            {
                this._1200599363right18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right18", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get left24():Image
        {
            return (this._1106591607left24);
        }

        public function set right11(_arg_1:Image):void
        {
            var _local_2:Object = this._1200599356right11;
            if (_local_2 !== _arg_1)
            {
                this._1200599356right11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right11", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get left22():Image
        {
            return (this._1106591609left22);
        }

        public function set right10(_arg_1:Image):void
        {
            var _local_2:Object = this._1200599355right10;
            if (_local_2 !== _arg_1)
            {
                this._1200599355right10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right10", _local_2, _arg_1));
            };
        }

        public function set right14(_arg_1:Image):void
        {
            var _local_2:Object = this._1200599359right14;
            if (_local_2 !== _arg_1)
            {
                this._1200599359right14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right14", _local_2, _arg_1));
            };
        }

        public function set right20(_arg_1:Image):void
        {
            var _local_2:Object = this._1200599386right20;
            if (_local_2 !== _arg_1)
            {
                this._1200599386right20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right20", _local_2, _arg_1));
            };
        }

        public function ___HappyFrontLinePanel_Button1_click(_arg_1:MouseEvent):void
        {
            playHappyFrontLine(5);
        }

        [Bindable(event="propertyChange")]
        public function get oneItem4():ItemSlot
        {
            return (this._1982093499oneItem4);
        }

        [Bindable(event="propertyChange")]
        public function get oneItem6():ItemSlot
        {
            return (this._1982093501oneItem6);
        }

        [Bindable(event="propertyChange")]
        public function get oneItem0():ItemSlot
        {
            return (this._1982093495oneItem0);
        }

        [Bindable(event="propertyChange")]
        public function get oneItem1():ItemSlot
        {
            return (this._1982093496oneItem1);
        }

        public function ___HappyFrontLinePanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        [Bindable(event="propertyChange")]
        public function get oneItem7():ItemSlot
        {
            return (this._1982093502oneItem7);
        }

        [Bindable(event="propertyChange")]
        public function get oneItem8():ItemSlot
        {
            return (this._1982093503oneItem8);
        }

        [Bindable(event="propertyChange")]
        public function get oneItem9():ItemSlot
        {
            return (this._1982093504oneItem9);
        }

        [Bindable(event="propertyChange")]
        public function get oneItem2():ItemSlot
        {
            return (this._1982093497oneItem2);
        }

        public function set rightResult(_arg_1:Image):void
        {
            var _local_2:Object = this._453021351rightResult;
            if (_local_2 !== _arg_1)
            {
                this._453021351rightResult = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rightResult", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get oneItem5():ItemSlot
        {
            return (this._1982093500oneItem5);
        }

        public function set left11(_arg_1:Image):void
        {
            var _local_2:Object = this._1106591641left11;
            if (_local_2 !== _arg_1)
            {
                this._1106591641left11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left11", _local_2, _arg_1));
            };
        }

        public function set left13(_arg_1:Image):void
        {
            var _local_2:Object = this._1106591639left13;
            if (_local_2 !== _arg_1)
            {
                this._1106591639left13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left13", _local_2, _arg_1));
            };
        }

        public function set left10(_arg_1:Image):void
        {
            var _local_2:Object = this._1106591642left10;
            if (_local_2 !== _arg_1)
            {
                this._1106591642left10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left10", _local_2, _arg_1));
            };
        }

        public function set left15(_arg_1:Image):void
        {
            var _local_2:Object = this._1106591637left15;
            if (_local_2 !== _arg_1)
            {
                this._1106591637left15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left15", _local_2, _arg_1));
            };
        }

        public function set left17(_arg_1:Image):void
        {
            var _local_2:Object = this._1106591635left17;
            if (_local_2 !== _arg_1)
            {
                this._1106591635left17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left17", _local_2, _arg_1));
            };
        }

        public function set left14(_arg_1:Image):void
        {
            var _local_2:Object = this._1106591638left14;
            if (_local_2 !== _arg_1)
            {
                this._1106591638left14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left14", _local_2, _arg_1));
            };
        }

        public function set item11(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1178662797item11;
            if (_local_2 !== _arg_1)
            {
                this._1178662797item11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item11", _local_2, _arg_1));
            };
        }

        public function set item12(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1178662796item12;
            if (_local_2 !== _arg_1)
            {
                this._1178662796item12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item12", _local_2, _arg_1));
            };
        }

        public function set right24(_arg_1:Image):void
        {
            var _local_2:Object = this._1200599390right24;
            if (_local_2 !== _arg_1)
            {
                this._1200599390right24 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right24", _local_2, _arg_1));
            };
        }

        public function set item13(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1178662795item13;
            if (_local_2 !== _arg_1)
            {
                this._1178662795item13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item13", _local_2, _arg_1));
            };
        }

        public function set item10(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1178662798item10;
            if (_local_2 !== _arg_1)
            {
                this._1178662798item10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item10", _local_2, _arg_1));
            };
        }

        public function set left19(_arg_1:Image):void
        {
            var _local_2:Object = this._1106591633left19;
            if (_local_2 !== _arg_1)
            {
                this._1106591633left19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left19", _local_2, _arg_1));
            };
        }

        public function set item15(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1178662793item15;
            if (_local_2 !== _arg_1)
            {
                this._1178662793item15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item15", _local_2, _arg_1));
            };
        }

        public function set right21(_arg_1:Image):void
        {
            var _local_2:Object = this._1200599387right21;
            if (_local_2 !== _arg_1)
            {
                this._1200599387right21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right21", _local_2, _arg_1));
            };
        }

        public function set left12(_arg_1:Image):void
        {
            var _local_2:Object = this._1106591640left12;
            if (_local_2 !== _arg_1)
            {
                this._1106591640left12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left12", _local_2, _arg_1));
            };
        }

        public function set left18(_arg_1:Image):void
        {
            var _local_2:Object = this._1106591634left18;
            if (_local_2 !== _arg_1)
            {
                this._1106591634left18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left18", _local_2, _arg_1));
            };
        }

        public function set item16(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1178662792item16;
            if (_local_2 !== _arg_1)
            {
                this._1178662792item16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item16", _local_2, _arg_1));
            };
        }

        public function set item14(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1178662794item14;
            if (_local_2 !== _arg_1)
            {
                this._1178662794item14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item14", _local_2, _arg_1));
            };
        }

        public function ___HappyFrontLinePanel_Button6_click(_arg_1:MouseEvent):void
        {
            playHappyFrontLine(6);
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

        private function _HappyFrontLinePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HAPPY_FRONT_LINE[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HappyFrontLinePanel_BasicTitleCanvas1.text = _arg_1;
            }, "_HappyFrontLinePanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HAPPY_FRONT_LINE[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn0.label = _arg_1;
            }, "bangBtn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HAPPY_FRONT_LINE[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn1.label = _arg_1;
            }, "bangBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000695));
            }, function (_arg_1:Object):void
            {
                _HappyFrontLinePanel_Image1.source = _arg_1;
            }, "_HappyFrontLinePanel_Image1.source");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HAPPY_FRONT_LINE[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                guize.text = _arg_1;
            }, "guize.text");
            result[4] = binding;
            return (result);
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

        public function set left16(_arg_1:Image):void
        {
            var _local_2:Object = this._1106591636left16;
            if (_local_2 !== _arg_1)
            {
                this._1106591636left16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left16", _local_2, _arg_1));
            };
        }

        public function set item6(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._100525955item6;
            if (_local_2 !== _arg_1)
            {
                this._100525955item6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item6", _local_2, _arg_1));
            };
        }

        public function showPanel():*
        {
            initView();
            visible = true;
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

        public function set item8(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._100525957item8;
            if (_local_2 !== _arg_1)
            {
                this._100525957item8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item8", _local_2, _arg_1));
            };
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

        public function set item9(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._100525958item9;
            if (_local_2 !== _arg_1)
            {
                this._100525958item9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get left4():Image
        {
            return (this._102850829left4);
        }

        public function set left22(_arg_1:Image):void
        {
            var _local_2:Object = this._1106591609left22;
            if (_local_2 !== _arg_1)
            {
                this._1106591609left22 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left22", _local_2, _arg_1));
            };
        }

        public function set item7(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._100525956item7;
            if (_local_2 !== _arg_1)
            {
                this._100525956item7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item7", _local_2, _arg_1));
            };
        }

        private function playHappyFrontLine(typeNum:Number):void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("playHappyFrontLine", null, typeNum);
                };
            };
            var tempStr:String = "";
            if (typeNum == 1)
            {
                tempStr = Language.HAPPY_FRONT_LINE[4].replace("{num}", happyFrontLineConf.suijiprice);
            }
            else
            {
                if (typeNum == 2)
                {
                    tempStr = Language.HAPPY_FRONT_LINE[5].replace("{num}", happyFrontLineConf.jingqueprice[lightGridNum]);
                }
                else
                {
                    if (typeNum == 3)
                    {
                        tempStr = Language.HAPPY_FRONT_LINE[6].replace("{num}", happyFrontLineConf.jishuprice);
                    }
                    else
                    {
                        if (typeNum == 4)
                        {
                            tempStr = Language.HAPPY_FRONT_LINE[7].replace("{num}", happyFrontLineConf.oushuprice);
                        }
                        else
                        {
                            if (typeNum == 5)
                            {
                                tempStr = Language.HAPPY_FRONT_LINE[8].replace("{num}", happyFrontLineConf.chongzhiprice);
                            }
                            else
                            {
                                if (typeNum == 6)
                                {
                                    tempStr = Language.HAPPY_FRONT_LINE[9].replace("{num}", happyFrontLineConf.freshprice);
                                };
                            };
                        };
                    };
                };
            };
            Alert.show(tempStr, "", (Alert.YES | Alert.NO), null, func);
        }

        public function set left21(_arg_1:Image):void
        {
            var _local_2:Object = this._1106591610left21;
            if (_local_2 !== _arg_1)
            {
                this._1106591610left21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left21", _local_2, _arg_1));
            };
        }

        public function set left25(_arg_1:Image):void
        {
            var _local_2:Object = this._1106591606left25;
            if (_local_2 !== _arg_1)
            {
                this._1106591606left25 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left25", _local_2, _arg_1));
            };
        }

        public function __bangBtn0_click(_arg_1:MouseEvent):void
        {
            changeView(0);
        }

        [Bindable(event="propertyChange")]
        public function get left6():Image
        {
            return (this._102850831left6);
        }

        public function set left23(_arg_1:Image):void
        {
            var _local_2:Object = this._1106591608left23;
            if (_local_2 !== _arg_1)
            {
                this._1106591608left23 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left23", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get left8():Image
        {
            return (this._102850833left8);
        }

        [Bindable(event="propertyChange")]
        public function get left2():Image
        {
            return (this._102850827left2);
        }

        [Bindable(event="propertyChange")]
        public function get left3():Image
        {
            return (this._102850828left3);
        }

        [Bindable(event="propertyChange")]
        public function get left7():Image
        {
            return (this._102850832left7);
        }

        public function set left24(_arg_1:Image):void
        {
            var _local_2:Object = this._1106591607left24;
            if (_local_2 !== _arg_1)
            {
                this._1106591607left24 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left24", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get left1():Image
        {
            return (this._102850826left1);
        }

        [Bindable(event="propertyChange")]
        public function get left5():Image
        {
            return (this._102850830left5);
        }

        [Bindable(event="propertyChange")]
        public function get lltOneItem():ItemSlot
        {
            return (this._1034521339lltOneItem);
        }

        [Bindable(event="propertyChange")]
        public function get left9():Image
        {
            return (this._102850834left9);
        }

        public function set right22(_arg_1:Image):void
        {
            var _local_2:Object = this._1200599388right22;
            if (_local_2 !== _arg_1)
            {
                this._1200599388right22 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right22", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get oneItem3():ItemSlot
        {
            return (this._1982093498oneItem3);
        }

        public function set right3(_arg_1:Image):void
        {
            var _local_2:Object = this._931102313right3;
            if (_local_2 !== _arg_1)
            {
                this._931102313right3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right3", _local_2, _arg_1));
            };
        }

        public function set right5(_arg_1:Image):void
        {
            var _local_2:Object = this._931102311right5;
            if (_local_2 !== _arg_1)
            {
                this._931102311right5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right5", _local_2, _arg_1));
            };
        }

        public function ___HappyFrontLinePanel_Button3_click(_arg_1:MouseEvent):void
        {
            playHappyFrontLine(3);
        }

        public function set right6(_arg_1:Image):void
        {
            var _local_2:Object = this._931102310right6;
            if (_local_2 !== _arg_1)
            {
                this._931102310right6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right6", _local_2, _arg_1));
            };
        }

        public function set vsFlop(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._808329852vsFlop;
            if (_local_2 !== _arg_1)
            {
                this._808329852vsFlop = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vsFlop", _local_2, _arg_1));
            };
        }

        public function set right1(_arg_1:Image):void
        {
            var _local_2:Object = this._931102315right1;
            if (_local_2 !== _arg_1)
            {
                this._931102315right1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get right10():Image
        {
            return (this._1200599355right10);
        }

        [Bindable(event="propertyChange")]
        public function get leftResult():Image
        {
            return (this._2075718404leftResult);
        }

        [Bindable(event="propertyChange")]
        public function get right13():Image
        {
            return (this._1200599358right13);
        }

        [Bindable(event="propertyChange")]
        public function get right14():Image
        {
            return (this._1200599359right14);
        }

        [Bindable(event="propertyChange")]
        public function get right15():Image
        {
            return (this._1200599360right15);
        }

        [Bindable(event="propertyChange")]
        public function get right17():Image
        {
            return (this._1200599362right17);
        }

        [Bindable(event="propertyChange")]
        public function get right12():Image
        {
            return (this._1200599357right12);
        }

        public function set right7(_arg_1:Image):void
        {
            var _local_2:Object = this._931102309right7;
            if (_local_2 !== _arg_1)
            {
                this._931102309right7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right7", _local_2, _arg_1));
            };
        }

        public function set right8(_arg_1:Image):void
        {
            var _local_2:Object = this._931102308right8;
            if (_local_2 !== _arg_1)
            {
                this._931102308right8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get right18():Image
        {
            return (this._1200599363right18);
        }

        [Bindable(event="propertyChange")]
        public function get right11():Image
        {
            return (this._1200599356right11);
        }

        public function set guize(_arg_1:Text):void
        {
            var _local_2:Object = this._98712998guize;
            if (_local_2 !== _arg_1)
            {
                this._98712998guize = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guize", _local_2, _arg_1));
            };
        }

        public function set right2(_arg_1:Image):void
        {
            var _local_2:Object = this._931102314right2;
            if (_local_2 !== _arg_1)
            {
                this._931102314right2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get right19():Image
        {
            return (this._1200599364right19);
        }

        public function set right25(_arg_1:Image):void
        {
            var _local_2:Object = this._1200599391right25;
            if (_local_2 !== _arg_1)
            {
                this._1200599391right25 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right25", _local_2, _arg_1));
            };
        }

        public function set bangBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324756bangBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1863324756bangBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get right16():Image
        {
            return (this._1200599361right16);
        }

        public function set bangBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324755bangBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1863324755bangBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get right21():Image
        {
            return (this._1200599387right21);
        }

        [Bindable(event="propertyChange")]
        public function get right22():Image
        {
            return (this._1200599388right22);
        }

        public function set left20(_arg_1:Image):void
        {
            var _local_2:Object = this._1106591611left20;
            if (_local_2 !== _arg_1)
            {
                this._1106591611left20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left20", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get right25():Image
        {
            return (this._1200599391right25);
        }

        [Bindable(event="propertyChange")]
        public function get right20():Image
        {
            return (this._1200599386right20);
        }

        public function set right23(_arg_1:Image):void
        {
            var _local_2:Object = this._1200599389right23;
            if (_local_2 !== _arg_1)
            {
                this._1200599389right23 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right23", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get right24():Image
        {
            return (this._1200599390right24);
        }

        public function set right9(_arg_1:Image):void
        {
            var _local_2:Object = this._931102307right9;
            if (_local_2 !== _arg_1)
            {
                this._931102307right9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right9", _local_2, _arg_1));
            };
        }

        public function set oneItem0(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1982093495oneItem0;
            if (_local_2 !== _arg_1)
            {
                this._1982093495oneItem0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oneItem0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get rightResult():Image
        {
            return (this._453021351rightResult);
        }

        public function set oneItem3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1982093498oneItem3;
            if (_local_2 !== _arg_1)
            {
                this._1982093498oneItem3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oneItem3", _local_2, _arg_1));
            };
        }

        public function set oneItem4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1982093499oneItem4;
            if (_local_2 !== _arg_1)
            {
                this._1982093499oneItem4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oneItem4", _local_2, _arg_1));
            };
        }

        public function set oneItem2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1982093497oneItem2;
            if (_local_2 !== _arg_1)
            {
                this._1982093497oneItem2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oneItem2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get item5():ItemSlot
        {
            return (this._100525954item5);
        }

        [Bindable(event="propertyChange")]
        public function get item1():ItemSlot
        {
            return (this._100525950item1);
        }

        [Bindable(event="propertyChange")]
        public function get item3():ItemSlot
        {
            return (this._100525952item3);
        }

        [Bindable(event="propertyChange")]
        public function get item6():ItemSlot
        {
            return (this._100525955item6);
        }

        [Bindable(event="propertyChange")]
        public function get item7():ItemSlot
        {
            return (this._100525956item7);
        }

        [Bindable(event="propertyChange")]
        public function get item9():ItemSlot
        {
            return (this._100525958item9);
        }

        [Bindable(event="propertyChange")]
        public function get item2():ItemSlot
        {
            return (this._100525951item2);
        }

        override public function initialize():void
        {
            var target:HappyFrontLinePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _HappyFrontLinePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_HappyFrontLinePanelWatcherSetupUtil");
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

        public function set oneItem1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1982093496oneItem1;
            if (_local_2 !== _arg_1)
            {
                this._1982093496oneItem1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oneItem1", _local_2, _arg_1));
            };
        }

        public function set right4(_arg_1:Image):void
        {
            var _local_2:Object = this._931102312right4;
            if (_local_2 !== _arg_1)
            {
                this._931102312right4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get item8():ItemSlot
        {
            return (this._100525957item8);
        }

        [Bindable(event="propertyChange")]
        public function get right1():Image
        {
            return (this._931102315right1);
        }

        [Bindable(event="propertyChange")]
        public function get item4():ItemSlot
        {
            return (this._100525953item4);
        }

        [Bindable(event="propertyChange")]
        public function get right7():Image
        {
            return (this._931102309right7);
        }

        public function set oneItem6(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1982093501oneItem6;
            if (_local_2 !== _arg_1)
            {
                this._1982093501oneItem6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oneItem6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get right6():Image
        {
            return (this._931102310right6);
        }

        public function set oneItem9(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1982093504oneItem9;
            if (_local_2 !== _arg_1)
            {
                this._1982093504oneItem9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oneItem9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get right23():Image
        {
            return (this._1200599389right23);
        }

        [Bindable(event="propertyChange")]
        public function get right9():Image
        {
            return (this._931102307right9);
        }

        public function set oneItem5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1982093500oneItem5;
            if (_local_2 !== _arg_1)
            {
                this._1982093500oneItem5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oneItem5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get guize():Text
        {
            return (this._98712998guize);
        }

        [Bindable(event="propertyChange")]
        public function get right4():Image
        {
            return (this._931102312right4);
        }

        public function set oneItem7(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1982093502oneItem7;
            if (_local_2 !== _arg_1)
            {
                this._1982093502oneItem7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oneItem7", _local_2, _arg_1));
            };
        }

        public function set oneItem8(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1982093503oneItem8;
            if (_local_2 !== _arg_1)
            {
                this._1982093503oneItem8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oneItem8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn0():BasicGlowButton
        {
            return (this._1863324756bangBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn1():BasicGlowButton
        {
            return (this._1863324755bangBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get right2():Image
        {
            return (this._931102314right2);
        }

        [Bindable(event="propertyChange")]
        public function get right3():Image
        {
            return (this._931102313right3);
        }

        [Bindable(event="propertyChange")]
        public function get right8():Image
        {
            return (this._931102308right8);
        }

        public function ___HappyFrontLinePanel_Button5_click(_arg_1:MouseEvent):void
        {
            playHappyFrontLine(4);
        }

        [Bindable(event="propertyChange")]
        public function get right5():Image
        {
            return (this._931102311right5);
        }

        [Bindable(event="propertyChange")]
        public function get vsFlop():ViewStack
        {
            return (this._808329852vsFlop);
        }

        public function CZHappyFrontLineNum(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:int;
            var _local_4:int;
            happyFrontLineData = _arg_1;
            lightGridNum = 0;
            for (_local_2 in happyFrontLineData.allGrid)
            {
                _local_3 = (happyFrontLineData.allGrid[_local_2] % 10);
                _local_4 = int(((happyFrontLineData.allGrid[_local_2] - _local_3) / 10));
                this[("left" + _local_2)].source = ResManager.getIconUrl(resDarkArr[_local_4]);
                this[("right" + _local_2)].source = ResManager.getIconUrl(resDarkArr[_local_3]);
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _core.remote.call("initHappyFrontLineData", new Responder(onInitHappyFrontLineData));
        }

        public function ___HappyFrontLinePanel_Button2_click(_arg_1:MouseEvent):void
        {
            playHappyFrontLine(1);
        }

        public function freshHappyFrontLineNum(_arg_1:Number, _arg_2:Number, _arg_3:Number):void
        {
            leftResult.visible = true;
            rightResult.visible = true;
            lightGridNum = _arg_3;
            if ((_arg_2 % 2) == 0)
            {
                delete happyFrontLineData.hadNotOuShuGrid[_arg_1];
            }
            else
            {
                delete happyFrontLineData.hadNotJiShuGrid[_arg_1];
            };
            var _local_4:int = (_arg_2 % 10);
            var _local_5:int = int(((_arg_2 - _local_4) / 10));
            leftResult.source = ResManager.getIconUrl(resLightArr[_local_5]);
            rightResult.source = ResManager.getIconUrl(resLightArr[_local_4]);
            if (((_arg_1 >= 1) && (_arg_1 <= 25)))
            {
                this[("left" + _arg_1)].source = ResManager.getIconUrl(resLightArr[_local_5]);
                this[("right" + _arg_1)].source = ResManager.getIconUrl(resLightArr[_local_4]);
            };
        }

        private function onInitHappyFrontLineData(_arg_1:Object):void
        {
            var _local_4:*;
            var _local_5:int;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:Number;
            var _local_11:Number;
            var _local_12:Number;
            var _local_13:Number;
            var _local_14:Number;
            var _local_15:Number;
            var _local_16:Number;
            var _local_17:Number;
            var _local_18:int;
            var _local_19:int;
            if (!_arg_1)
            {
                return;
            };
            happyFrontLineData = _arg_1.data;
            happyFrontLineConf = _arg_1.conf;
            happyFrontLineOneItemObj = _arg_1.oneitem;
            lightGridNum = happyFrontLineData.hadGridNum;
            if (((happyFrontLineData.lastNum >= 0) && (happyFrontLineData.lastNum <= 99)))
            {
                leftResult.visible = true;
                rightResult.visible = true;
                _local_10 = (happyFrontLineData.lastNum % 10);
                _local_11 = ((happyFrontLineData.lastNum - _local_10) / 10);
                leftResult.source = ResManager.getIconUrl(resLightArr[_local_11]);
                rightResult.source = ResManager.getIconUrl(resLightArr[_local_10]);
            }
            else
            {
                leftResult.visible = false;
                rightResult.visible = false;
            };
            var _local_2:String = Language.HAPPY_FRONT_LINE[10].replace("{time1}", TimeUtil.dateTimeToString(new Date(happyFrontLineConf.start))).replace("{time2}", TimeUtil.dateTimeToString(new Date(happyFrontLineConf.end))).replace("{num1}", happyFrontLineConf.suijiprice).replace("{num2}", happyFrontLineConf.jishuprice).replace("{num3}", happyFrontLineConf.chongzhiprice).replace("{num4}", happyFrontLineConf.freshprice);
            var _local_3:Number = 1;
            for (_local_4 in happyFrontLineConf.iInfo)
            {
                if (happyFrontLineConf.iInfo[_local_4].inc == 2)
                {
                    this[("item" + _local_3)].type = GamePredef.TBL_ITEM_TEMPLATE;
                    this[("item" + _local_3)].giid = happyFrontLineConf.iInfo[_local_4].iid;
                    this[("item" + _local_3)].slotData = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][happyFrontLineConf.iInfo[_local_4].iid];
                    _local_3++;
                }
                else
                {
                    if (happyFrontLineConf.iInfo[_local_4].inc == 3)
                    {
                        _local_2 = (_local_2 + (GameData.d[GamePredef.TBL_ITEM_TEMPLATE][happyFrontLineConf.iInfo[_local_4].iid].name + "、"));
                    };
                };
            };
            guize.htmlText = (_local_2.substr(0, (_local_2.length - 1)) + "。");
            _local_5 = 0;
            while (_local_5 < 10)
            {
                this[("oneItem" + _local_5)].type = GamePredef.TBL_ITEM_TEMPLATE;
                this[("oneItem" + _local_5)].giid = happyFrontLineOneItemObj[(_local_5 + 1)].iid;
                this[("oneItem" + _local_5)].slotData = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][happyFrontLineOneItemObj[(_local_5 + 1)].iid];
                _local_5++;
            };
            lltOneItem.type = GamePredef.TBL_ITEM_TEMPLATE;
            lltOneItem.giid = happyFrontLineData.lltItem;
            lltOneItem.slotData = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][happyFrontLineData.lltItem];
            var _local_6:Object = happyFrontLineData.allGrid;
            for (_local_7 in happyFrontLineData.hadNotJiShuGrid)
            {
                _local_12 = happyFrontLineData.hadNotJiShuGrid[_local_7];
                _local_13 = (_local_6[_local_12] % 10);
                _local_14 = ((_local_6[_local_12] - _local_13) / 10);
                this[("left" + _local_12)].source = ResManager.getIconUrl(resDarkArr[_local_14]);
                this[("right" + _local_12)].source = ResManager.getIconUrl(resDarkArr[_local_13]);
                delete _local_6[_local_7];
            };
            for (_local_8 in happyFrontLineData.hadNotOuShuGrid)
            {
                _local_15 = happyFrontLineData.hadNotOuShuGrid[_local_8];
                _local_16 = (_local_6[_local_15] % 10);
                _local_17 = ((_local_6[_local_15] - _local_16) / 10);
                this[("left" + _local_15)].source = ResManager.getIconUrl(resDarkArr[_local_17]);
                this[("right" + _local_15)].source = ResManager.getIconUrl(resDarkArr[_local_16]);
                delete _local_6[_local_8];
            };
            for (_local_9 in _local_6)
            {
                _local_18 = (_local_6[_local_9] % 10);
                _local_19 = int(((_local_6[_local_9] - _local_18) / 10));
                this[("left" + _local_9)].source = ResManager.getIconUrl(resLightArr[_local_19]);
                this[("right" + _local_9)].source = ResManager.getIconUrl(resLightArr[_local_18]);
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

