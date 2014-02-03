import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Window 2.0

ApplicationWindow {
    title: "Sign up!"
    width: 400
    height: width * 0.75

    Column {
        ExclusiveGroup {
            id: plans
            onCurrentChanged: terms.checked = false
        }
        RadioButton {
            exclusiveGroup: plans
            text: "Hobbyist"
        }
        RadioButton {
            exclusiveGroup: plans
            text: "Enterprise"
        }
        CheckBox {
            id: terms
            text: "Accept Terms and Conditions"
        }
        Button {
            text: "Sign up!"
            enabled: terms.checked
        }
    }
}
